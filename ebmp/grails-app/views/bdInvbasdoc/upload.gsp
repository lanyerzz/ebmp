<div style="margin-left:10px;margin-top:50px;">
    <g:uploadForm name="myUpload" method="post" enctype="multipart/form-data" controller="bdInvbasdoc" action="saveDataFile" target="hidden_iframe">
        <input type="file" name="file" />
        <input type="submit" title="上传">
    </g:uploadForm>
    <iframe id="hidden_iframe" name="hidden_iframe" style="display:none;"></iframe>
</div>