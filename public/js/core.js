function addOption (listbox, text, value, isSelected)
{
  var oListbox = document.getElementById(listbox);
if  (oListbox ) {


var i;
  for (i = oListbox.length - 1; i>=0; i--) {
    if (oListbox.options[i].value==value) oListbox.remove(i);    
  }


  var oOption = document.createElement("option");
  oOption.appendChild(document.createTextNode(text));
  oOption.setAttribute("value", value);
  if (isSelected) oOption.selected = true;
  oListbox.appendChild(oOption);}
}


function sorted(id,sel)
 {
  for(var c=document.getElementById(id),b=c.options,a=0;a<b.length;)
	if(b[a+1]&&b[a].text>b[a+1].text){c.insertBefore(b[a+1],b[a]);a=a>=1?a-1:a+1}else a++;
	if (b[0]) b[0].selected=true; 


 if (sel!="") {
    var oListbox = document.getElementById(id)
    for (var i = oListbox.length - 1; i>=0; i--) {
    if (oListbox.options[i].value==sel) oListbox.options[i].selected=true;     
  }
 }
};