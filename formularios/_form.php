
<!-- THREE STEPS TO INSTALL DFILTER:

  1.  Download the external JavaScript file
  2.  Copy the coding into the HEAD of your HTML document
  3.  Add the last code into the BODY of your HTML document  -->

<!-- STEP ONE: Download the external JavaScript file here:  -->

http://www.javascriptsource.com/forms/dFilter.js


<!-- STEP TWO: Paste this code into the HEAD of your HTML document  -->

<HEAD>

    <!-- This script and many more are available free online at -->
    <!-- The JavaScript Source!! http://www.javascriptsource.com -->

    <script type='text/javascript' src='../lib/dFilter.js'></script>
</script>

</HEAD>

<!-- STEP TWO: Copy this code into the BODY of your HTML document  -->

<BODY>

    <!-- This script and many more are available free online at -->
    <!-- The JavaScript Source!! http://www.javascriptsource.com -->

    <form name="fred" action="fred.htm" method="post">
        <table>
            <tr>
                <td>SSN:</td>
                <td><input value="" type="text" onKeyDown="javascript:return dFilter(event.keyCode, this, '###-##-[#]{2,4}');" style="font-family:verdana;font-size:10pt;width:110px;"></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input value="" type="text" onKeyDown="javascript:return dFilter(event.keyCode, this, '(###) ###-####');" style="font-family:verdana;font-size:10pt;width:110px;"></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td><input value="" type="text" onKeyDown="javascript:return dFilter(event.keyCode, this, '#####-####');" style="font-family:verdana;font-size:10pt;width:110px;"></td>
            </tr>
        </table>
    </form>

    <p><center>
    <font face="arial, helvetica" size"-2">Free JavaScripts provided<br>
    by <a href="http://javascriptsource.com">The JavaScript Source</a></font>
</center><p>

    <!-- Script Size:  1.63 KB -->