def vos=binding.getVariable('data');
def data = []
vos?.each {
    data << it.part([defaultPart:true])
}
binding.setVariable('returnValue',data);