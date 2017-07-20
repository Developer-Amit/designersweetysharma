<?php 
function minify_css($input) {
    if(trim($input) === "") return $input;
    return preg_replace(
        array(
            // Remove comment(s)
            '#("(?:[^"\\\]++|\\\.)*+"|\'(?:[^\'\\\\]++|\\\.)*+\')|\/\*(?!\!)(?>.*?\*\/)|^\s*|\s*$#s',
            // Remove unused white-space(s)
            '#("(?:[^"\\\]++|\\\.)*+"|\'(?:[^\'\\\\]++|\\\.)*+\'|\/\*(?>.*?\*\/))|\s*+;\s*+(})\s*+|\s*+([*$~^|]?+=|[{};,>~+]|\s*+-(?![0-9\.])|!important\b)\s*+|([[(:])\s++|\s++([])])|\s++(:)\s*+(?!(?>[^{}"\']++|"(?:[^"\\\]++|\\\.)*+"|\'(?:[^\'\\\\]++|\\\.)*+\')*+{)|^\s++|\s++\z|(\s)\s+#si',
            // Replace `0(cm|em|ex|in|mm|pc|pt|px|vh|vw|%)` with `0`
            '#(?<=[\s:])(0)(cm|em|ex|in|mm|pc|pt|px|vh|vw|%)#si',
            // Replace `:0 0 0 0` with `:0`
           // '#:(0\s+0|0\s+0\s+0\s+0)(?=[;\}]|\!important)#i',
            // Replace `background-position:0` with `background-position:0 0`
            '#(background-position):0(?=[;\}])#si',
            // Replace `0.6` with `.6`, but only when preceded by `:`, `,`, `-` or a white-space
            '#(?<=[\s:,\-])0+\.(\d+)#s',
            // Minify string value
            '#(\/\*(?>.*?\*\/))|(?<!content\:)([\'"])([a-z_][a-z0-9\-_]*?)\2(?=[\s\{\}\];,])#si',
            '#(\/\*(?>.*?\*\/))|(\burl\()([\'"])([^\s]+?)\3(\))#si',
            // Minify HEX color code
            '#(?<=[\s:,\-]\#)([a-f0-6]+)\1([a-f0-6]+)\2([a-f0-6]+)\3#i',
            // Replace `(border|outline):none` with `(border|outline):0`
            '#(?<=[\{;])(border|outline):none(?=[;\}\!])#',
            // Remove empty selector(s)
            '#(\/\*(?>.*?\*\/))|(^|[\{\}])(?:[^\s\{\}]+)\{\}#s'
        ),
        array(
            '$1',
            '$1$2$3$4$5$6$7',
            '$1',
          //  ':0',
            '$1:0 0',
            '.$1',
            '$1$3',
            '$1$2$4$5',
            '$1$2$3',
            '$1:0',
            '$1$2'
        ),
    $input);
}


function base62encode($data) {
	$outstring = '';
	$l = strlen($data);
	for ($i = 0; $i < $l; $i += 8) {
		$chunk = substr($data, $i, 8);
		$outlen = ceil((strlen($chunk) * 8)/6); //8bit/char in, 6bits/char out, round up
		$x = bin2hex($chunk);  //gmp won't convert from binary, so go via hex
		$w = gmp_strval(gmp_init(ltrim($x, '0'), 16), 62); //gmp doesn't like leading 0s
		$pad = str_pad($w, $outlen, '0', STR_PAD_LEFT);
		$outstring .= $pad;
	}
	return $outstring;
}

function base62decode($data) {
	$outstring = '';
	$l = strlen($data);
	for ($i = 0; $i < $l; $i += 11) {
		$chunk = substr($data, $i, 11);
		$outlen = floor((strlen($chunk) * 6)/8); //6bit/char in, 8bits/char out, round down
		$y = gmp_strval(gmp_init(ltrim($chunk, '0'), 62), 16); //gmp doesn't like leading 0s
		$pad = str_pad($y, $outlen * 2, '0', STR_PAD_LEFT); //double output length as as we're going via hex (4bits/char)
		$outstring .= pack('H*', $pad); //same as hex2bin
	}
	return $outstring;
}


require 'Packer.php';
error_reporting(E_ALL);

$js = file_get_contents($_POST['dir'].'view/javascript/custom/custom.js');
$packer = new Tholu\Packer\Packer($js, 'Normal', true, true);
$packed_js = $packer->pack();


file_put_contents($_POST['dir'].'view/javascript/custom/custom.min.js',$packed_js);

file_put_contents($_POST['dir'].'view/theme/' .  $_POST['theme'] . '/stylesheet/stylesheet.min.css', minify_css(file_get_contents($_POST['dir'].'view/theme/' .  $_POST['theme'] . '/stylesheet/stylesheet.css')));
file_put_contents($_POST['dir'].'view/theme/' .  $_POST['theme'] . '/stylesheet/nilkanthinfo/responsive.min.css', minify_css(file_get_contents($_POST['dir'].'view/theme/' .  $_POST['theme'] . '/stylesheet/nilkanthinfo/responsive.css')));

?>