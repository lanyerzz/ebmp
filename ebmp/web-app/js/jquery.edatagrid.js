/**
 * edatagrid - jQuery EasyUI
 * 
 * Licensed under the GPL:
 *   http://www.gnu.org/licenses/gpl.txt
 *
 * Copyright 2011 stworthy [ stworthy@gmail.com ] 
 * 
 * Dependencies:
 *   datagrid
 *   messager
 * 
 */
(function($){
	function buildGrid(target){
		var opts = $.data(target, 'edatagrid').options;
		$(target).datagrid($.extend({}, opts, {
			onDblClickCell:function(index,field){
				if (opts.editing){

					$(this).edatagrid('editRow', index);
					focusEditor(field);

				}
			},
			onClickCell:function(index,field){

//                $.messager.progress();
				if (opts.editing && opts.editIndex >= 0){
					$(this).edatagrid('editRow', index);
					focusEditor(field);
				}
//                $.messager.progress('close');
			},
            onClickRow:function(rowIndex, rowData){
                if (opts.editing){
                    $(this).edatagrid('saveRow');
                }

            },

			onAfterEdit: function(index, row){
				opts.editIndex = undefined;
				var url = row.isNewRecord ? opts.saveUrl : opts.updateUrl;
				if (url){
					$.post(url, row, function(data){
						data.isNewRecord = null;
						$(target).datagrid('updateRow', {
							index: index,
							row: data
						});
						if (opts.tree){
							var idValue = row[opts.idField||'id'];
							var t = $(opts.tree);
							var node = t.tree('find', idValue);
							if (node){
								node.text = row[opts.treeTextField];
								t.tree('update', node);
							} else {
								var pnode = t.tree('find', row[opts.treeParentField]);
								t.tree('append', {
									parent: (pnode ? pnode.target : null),
									data: [{id:idValue,text:row[opts.treeTextField]}]
								});
							}
						}
						opts.onSave.call(target, index, row);
					},'json');
				} else {
					opts.onSave.call(target, index, row);
				}
				if (opts.onAfterEdit) opts.onAfterEdit.call(target, index, row);
                $(this).datagrid('statistics');
                if(opts.onAfterEdit1){
                    opts.onAfterEdit1(index, row);
                }

			},
			onCancelEdit: function(index, row){
				opts.editIndex = undefined;
				if (row.isNewRecord) {
					$(this).datagrid('deleteRow', index);
				}
				if (opts.onCancelEdit) opts.onCancelEdit.call(target, index, row);
			},
			onBeforeLoad: function(param){
				$(this).datagrid('rejectChanges');
				if (opts.tree){
					var node = $(opts.tree).tree('getSelected');
					param[opts.treeParentField] = node ? node.id : undefined;
				}
				if (opts.onBeforeLoad) opts.onBeforeLoad.call(target, param);
			}
		}));
		
		function focusEditor(field){
			var editor = $(target).datagrid('getEditor', {index:opts.editIndex,field:field});
			if (editor){
				editor.target.focus();
			} else {
				var editors = $(target).datagrid('getEditors', opts.editIndex);
				if (editors.length){
					editors[0].target.focus();
				}
			}
		}
		
		if (opts.tree){
			$(opts.tree).tree({
				url: opts.treeUrl,
				onClick: function(node){
					$(target).datagrid('load');
				},
				onDrop: function(dest,source,point){
					var targetId = $(this).tree('getNode', dest).id;
					$.ajax({
						url: opts.treeDndUrl,
						type:'post',
						data:{
							id:source.id,
							targetId:targetId,
							point:point
						},
						dataType:'json',
						success:function(){
							$(target).datagrid('load');
						}
					});
				}
			});
		}
	}
	
	$.fn.edatagrid = function(options, param){
		if (typeof options == 'string'){
			var method = $.fn.edatagrid.methods[options];
			if (method){
				return method(this, param);
			} else {
				return this.datagrid(options, param);
			}
		}
		
		options = options || {};
		return this.each(function(){
			var state = $.data(this, 'edatagrid');
			if (state){
				$.extend(state.options, options);
			} else {
				$.data(this, 'edatagrid', {
					options: $.extend({}, $.fn.edatagrid.defaults, $.fn.edatagrid.parseOptions(this), options)
				});
			}
			buildGrid(this);
		});
	};
	
	$.fn.edatagrid.parseOptions = function(target){
		return $.extend({}, $.fn.datagrid.parseOptions(target), {
		});
	};
	
	$.fn.edatagrid.methods = {
		options: function(jq){
			var opts = $.data(jq[0], 'datagrid').options;
			return opts;
		},
        validateRows:validateRows,
        setLabelValue:setEditorValue,
        setColValue:setEditorValue,
        setSelectRowValue:setSelectRowValue,
        getSelectRowValue:getSelectRowValue,
        getJSON:getJsonData,
        getColValue:getEditorValue,
		enableEditing: function(jq){
			return jq.each(function(){
				var opts = $.data(this, 'edatagrid').options;
				opts.editing = true;
			});
		},
		disableEditing: function(jq){
			return jq.each(function(){
				var opts = $.data(this, 'edatagrid').options;
				opts.editing = false;
			});
		},
		editRow: function(jq, index){
			return jq.each(function(){
				var dg = $(this);
				var opts = $.data(this, 'edatagrid').options;
				var editIndex = opts.editIndex;

				if (editIndex != index){
					if (dg.datagrid('validateRow', editIndex)){
						if (editIndex>=0){
							if (opts.onBeforeSave.call(this, editIndex) == false) {
								setTimeout(function(){
									dg.datagrid('selectRow', editIndex);
								},0);
								return;
							}
						}

						dg.datagrid('endEdit', editIndex);
                        opts.editIndex = index;
						dg.datagrid('beginEdit', index);

						var rows = dg.datagrid('getRows');
						opts.onEdit.call(this, index, rows[index]);
					} else {
						setTimeout(function(){
							dg.datagrid('selectRow', editIndex);
						}, 0);
					}
				}
			});
		},addRow1: function(jq,data){
            return jq.each(function(){
                var dg = $(this);
                var opts = $.data(this, 'edatagrid').options;
                if (opts.editIndex >= 0){
                    if (!dg.datagrid('validateRow', opts.editIndex)){
                        dg.datagrid('selectRow', opts.editIndex);
                        return;
                    }
                    if (opts.onBeforeSave.call(this, opts.editIndex) == false){
                        setTimeout(function(){
                            dg.datagrid('selectRow', opts.editIndex);
                        },0);
                        return;
                    }
                    dg.datagrid('endEdit', opts.editIndex);
                }
                data['isNewRecord']=true;
                dg.datagrid('appendRow',data);
                var rows = dg.datagrid('getRows');
                opts.editIndex = rows.length - 1;
                dg.datagrid('selectRow', opts.editIndex);
                dg.datagrid('beginEdit', opts.editIndex);


                if (opts.tree){
                    var node = $(opts.tree).tree('getSelected');
                    rows[opts.editIndex][opts.treeParentField] = (node ? node.id : 0);
                }

                opts.onAdd.call(this, opts.editIndex, rows[opts.editIndex]);
            });
        },
		addRow: function(jq){
			return jq.each(function(){
				var dg = $(this);
				var opts = $.data(this, 'edatagrid').options;
				if (opts.editIndex >= 0){
					if (!dg.datagrid('validateRow', opts.editIndex)){
						dg.datagrid('selectRow', opts.editIndex);
						return;
					}
					if (opts.onBeforeSave.call(this, opts.editIndex) == false){
						setTimeout(function(){
							dg.datagrid('selectRow', opts.editIndex);
						},0);
						return;
					}
					dg.datagrid('endEdit', opts.editIndex);
				}
				dg.datagrid('appendRow', {isNewRecord:true});
				var rows = dg.datagrid('getRows');
				opts.editIndex = rows.length - 1;
				dg.datagrid('beginEdit', opts.editIndex);
				dg.datagrid('selectRow', opts.editIndex);
				
				if (opts.tree){
					var node = $(opts.tree).tree('getSelected');
					rows[opts.editIndex][opts.treeParentField] = (node ? node.id : 0);
				}
				
				opts.onAdd.call(this, opts.editIndex, rows[opts.editIndex]);
			});
		},
		saveRow: function(jq){
			return jq.each(function(){
				var dg = $(this);
				var opts = $.data(this, 'edatagrid').options;
				if (opts.onBeforeSave.call(this, opts.editIndex) == false) {
					setTimeout(function(){
						dg.datagrid('selectRow', opts.editIndex);
					},0);
					return;
				}
				$(this).datagrid('endEdit', opts.editIndex);
			});
		},
		cancelRow: function(jq){
			return jq.each(function(){
				var index = $(this).edatagrid('options').editIndex;
				$(this).datagrid('cancelEdit', index);
			});
		},
		destroyRow: function(jq){
			return jq.each(function(){
				var dg = $(this);
				var opts = $.data(this, 'edatagrid').options;
				var row = dg.datagrid('getSelected');
				if (!row){
					$.messager.show({
						title: opts.destroyMsg.norecord.title,
						msg: opts.destroyMsg.norecord.msg
					});
					return;
				}
				$.messager.confirm(opts.destroyMsg.confirm.title,opts.destroyMsg.confirm.msg,function(r){
					if (r){
						var index = dg.datagrid('getRowIndex', row);
						if (row.isNewRecord){
							dg.datagrid('cancelEdit', index);
						} else {
							if (opts.destroyUrl){
								var idValue = row[opts.idField||'id'];
								$.post(opts.destroyUrl, {id:idValue}, function(){
									if (opts.tree){
										dg.datagrid('reload');
										var t = $(opts.tree);
										var node = t.tree('find', idValue);
										if (node){
											t.tree('remove', node.target);
										}
									} else {
										dg.datagrid('cancelEdit', index);
										dg.datagrid('deleteRow', index);
									}
									opts.onDestroy.call(dg[0], index, row);
								});
							} else {
								dg.datagrid('cancelEdit', index);
								dg.datagrid('deleteRow', index);
								opts.onDestroy.call(dg[0], index, row);
							}
						}
					}
				});
			});
		}
	};
	
	$.fn.edatagrid.defaults = $.extend({}, $.fn.datagrid.defaults, {
		editing: true,
		editIndex: -1,
		destroyMsg:{
			norecord:{
				title:'Warning',
				msg:'No record is selected.'
			},
			confirm:{
				title:'Confirm',
				msg:'Are you sure you want to delete?'
			}
		},
//		destroyConfirmTitle: 'Confirm',
//		destroyConfirmMsg: 'Are you sure you want to delete?',
		
		url: null,	// return the datagrid data
		saveUrl: null,	// return the added row
		updateUrl: null,	// return the updated row
		destroyUrl: null,	// return {success:true}
		
		tree: null,		// the tree selector
		treeUrl: null,	// return tree data
		treeDndUrl: null,	// to process the drag and drop operation, return {success:true}
		treeTextField: 'name',
		treeParentField: 'parentId',
		
		onAdd: function(index, row){},
		onEdit: function(index, row){},
		onBeforeSave: function(index){},
		onSave: function(index, row){},
		onDestroy: function(index, row){},
        onSelect:function(rowIndex, rowData){
            //检查是否有编辑行

            var opts = $.data(this, 'edatagrid').options;
            var editIndex = opts.editIndex;
            if(editIndex>-1 && rowIndex!=editIndex){
                $(this).edatagrid('clearSelections');
                $(this).edatagrid('selectRow',editIndex);
            }


        }
	});
})(jQuery);



function allPrpos(obj) {
    // 用来保存所有的属性名称和值
    var props = "";
    // 开始遍历
    for(var p in obj){
        // 方法
        if(typeof(obj[p])=="function"){
            allPrpos("funtion:"+p+"="+obj[p]);
        }else{
            // p 为属性名称，obj[p]为对应属性的值
           // props += p + "=" + obj[p] + ";  ";
            alert("属性:"+p+"="+obj[p]);
        }
    }
    // 最后显示所有的属性

}
function getSelectRowValue(jq,f){
    var dg = $(jq[0]);
    var row=dg.edatagrid('getSelected');
    if(row==null) return;
    return getObjectAttr(row,f);
}

function setSelectRowValue(jq,fv){
    var dg = $(jq[0]);
    var row=dg.edatagrid('getSelected');
    if(row==null) return;
    setObjectAttr(row,fv.field,fv.value);
}

function setEditorValue(jq,fv){
    return  jq.each(function(){
        var opts = $.data(this, 'edatagrid').options;
        if(opts.editIndex<0) return;
        var dg = $(this);
        var index=opts.editIndex;
        dg.edatagrid('selectRow',index);
        var row=dg.edatagrid('getSelected');
        if(row==null) return;
        var i=index;


        var fireChange=fv.field.indexOf('@')==0
        var field
        if(fireChange)
            field=fv.field.substring(1)
        else
            field=fv.field
        var ed = dg.datagrid('getEditor', {index:i,field:field});

        setObjectAttr(row,field,fv.value);
        if(!isEmpty(ed)){


            if(ed.type=='numberbox'){

                if(fireChange){
                    $(ed.target).numberbox("setValue",fv.value);
                }else{
                    var precision=$(ed.target).numberbox('options').precision
                    var _value=fv.value.toFixed(precision);
                    $(ed.target).val(_value);

                    $(ed.target).parent().find('input[type=hidden]').val(_value);
                    $(ed.target).numberbox("fix");
                }


            }else if(ed.type=="label"){

                $(ed.target).val(fv.value);
            }else if(ed.type=="numberlabel"){

                $(ed.target).numberbox('setValue',fv.value);
            }else if(ed.type=="comboxgrid"){

                // $(ed.target).combox('setValue',fv.value);

                if(fv.value!=null && fv.value!=undefined){
                    var grid= $(ed.target).combogrid("grid");

                    $(grid).datagrid('options').url=$(ed.target).combogrid("options")._url+'/'+fv.value;

                    $(grid).datagrid('reload');
                    $(ed.target).combogrid("setValue",fv.value);
//               $(grid).datagrid('selectRecord',fv.value);
                }
            }else{
                row[field]=fv.value;
            }

        }

//        setObjectAttr(row,field,fv.value);


        $(dg).edatagrid('validateRow',i)
    });

}


function getEditorValue(jq,field){
    var _index=-1;
    var dg =null;
    jq.each(function(){
        var opts = $.data(this, 'edatagrid').options;
        dg=$(this);
      var _index=opts.editIndex;


  });

    dg.edatagrid('selectRow',_index);
    var row=dg.edatagrid('getSelected');
    if(row==null) return;
    var i=_index;

    var ed = dg.datagrid('getEditor', {index:i,field:field});

    if(ed!=null){

        if(ed.type=='numberbox'){

            var rt=  $(ed.target).numberbox("getValue");

            if(rt==''){
                var value=dg.edatagrid('getSelectRowValue',field);
                if(value==''){
                    return 0;
                }

                return parseFloat(value);
            }
            else{
                return parseFloat(rt)

            }

        }else if(ed.type=="label"){

            return $(ed.target).val();

        }else if(ed.type=="numberlabel"){

            var rt= $(ed.target).numberbox('getValue');
            if(rt==''){

                return 0;
            }
            else{
                return parseFloat(rt)

            }

        }else{
            return row[field];

        }

    }else{
        return row[field];
    }

}


function getJsonData(jq,deleted){



    var dg = $(jq[0]);
    var fields=dg.datagrid('getColumnFields');
    var col={};
    var col1={};
    $.each(fields,function(i,v){
        //alert(JSON.stringify(dg.datagrid('getColumnOption',v)));

        var opt=dg.datagrid('getColumnOption',v);

        col[v]=opt['canSave'];
        var editor=opt['editor'];
        if($.type(editor)=='object')
            col1[v]=opt['editor'].type;
        else
            col1[v]=opt['editor'];


    });
    //  alert(JSON.stringify(fields));


//            getChanges	type	Get changed rows since the last commit. The type parameter indicate which type changed rows, possible value is: inserted,deleted,updated,etc. When the type parameter is not assigned, return all changed rows.
//    dg.edatagrid('saveRow')
    var data= dg.datagrid('getRows');

    var rtData=[]
    $.each(data,function(i,row){
        var newrow={}
        //alert(JSON.stringify(row));
        $.each(row,function(i,c){


            if(col[i]==false){
                //alert('col[i]==false');
//                delete row[i];

            }else if($.type(c)=='number' && c==0){

                newrow[i]=0;
            }
            else if(c==null){

                newrow[i]='';
            }else if(c==''){

                //alert("c==''"+c)
                newrow[i]='';
            }else if(i=='dateCreated'){
                //delete row[i];
            }else if(i=='lastUpdated'){
                //delete row[i];
            }else if(col1[i]=='datebox'){

                newrow[i]=Date.parse(c).toString();
            }else if($.type(c)=='object'){

                if(c['id']){
                    newrow[i+'.id']=c['id'];
                }else{
                    newrow[i]='';
                }

            }else{

                newrow[i]=c;
            }

            //alert(newrow[i]);

        });

        rtData.push(newrow)

    });


    //增加 删除的数据
    //            getChanges	type	Get changed rows since the last commit. The type parameter indicate which type changed rows, possible value is: inserted,deleted,updated,etc. When the type parameter is not assigned, return all changed rows.
    if(deleted!=undefined && deleted == true){

        var deleted= dg.datagrid('getChanges','deleted');
        $.each(deleted,function(i,v){

            rtData.push({isDeleted:true,id: v.id})
        });
    }


    return rtData;



}


/**
 *
 * @param fn
 * @returns {boolean} false 验证未通过  true 验证通过
 */
function validateRows(jq){
    var dg = $(jq[0]);
    var rows= dg.datagrid('getRows');

    for(i=0;i<rows.length;i++){
        var vali= dg.datagrid('validateRow',i);
        if(!vali) {
            $.messager.show({
                title:'消息',
                msg:'表体数据未填写完整！'
            });
            $.messager.progress('close');
            return false;
        }
    }
    return true;
}
