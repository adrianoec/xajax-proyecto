
//Retrieve the current theme by the query string
var qs = new QueryStringMap();
var theme = qs.get("theme");
if (isEmpty(theme)) {
    //If none specified, get the default
    theme = "winxp";
}

//All possible themes
var availiableThemes = [
    {name:'winxp', description:'Windoze'},
    {name:'jst1x', description:'Old JavaScripTools'},
    {name:'simple', description:'Simple'},
    {name:'sand', description:'Sand'},
    {name:'blue', description:'Blue'},
    {name:'red', description:'Red'},
    {name:'grayscale', description:'Grayscale'}
];

//Creates the link to the theme style sheet
function createThemeLink() {
    document.write('<link rel="stylesheet" type="text/css" href="themes/' + theme + '.css">');
}

//Creates the input used to change the themes
function createThemeSelect() {
    document.write("<select name='theme' onchange='changeTheme(this.options[this.selectedIndex].value)'>");
    for (var i = 0; i < availiableThemes.length; i++) {
        var current = availiableThemes[i];
        document.write("<option value='" + current.name + "'");
        if (current.name == theme) {
            document.write(" selected");
        }
        document.write(">" + current.description + "</option>");
    }
    document.write("</select>");
}

//Changes the page theme
function changeTheme(newTheme) {
    var loc = self.location.href;
    var pos = loc.indexOf('?');
    if (pos > 0) {
        loc = loc.substring(0, pos);
    }
    self.location = loc + "?theme=" + newTheme;
}

