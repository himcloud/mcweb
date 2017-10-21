<?php
require_once('cons.php');
	function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {
	$ckey_length = 4;
	$key = md5($key ? $key : ENCRYPT_KEY);
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';
	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);
	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);
	$result = '';
	$box = range(0, 255);
	$rndkey = array();
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}
	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}
	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}
	if($operation == 'DECODE') {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		return $keyc.str_replace('=', '', base64_encode($result));
	}
}
function send_mail($from,$host,$Port,$pwd,$nick,$to,$sub,$msg){
	include_once 'smtp.class.php';
		$From = $from;
		$Host = $host;
		$Port = $Port;
		$SMTPAuth = 1;
		$Username = $from;
		$Password = $pwd;
		$Nickname = $nick;
		$SSL = false;
		$mail = new SMTP($Host , $Port , $SMTPAuth , $Username , $Password , $SSL);
		$mail->att = array();
		if($mail->send($to , $From , $sub , $msg, $Nickname)) {
			return true;
		} else {
			return $mail->log;
		}
	}
function encrypt($data, $syskey) { 
$prep_code = serialize($data); 
$block = mcrypt_get_block_size('des', 'ecb'); 
if (($pad = $block - (strlen($prep_code) % $block)) < $block) { 
$prep_code .= str_repeat(chr($pad), $pad); 
} 
$encrypt = mcrypt_encrypt(MCRYPT_DES, $key, $prep_code, MCRYPT_MODE_ECB); 
return base64_encode($encrypt); 
} 

function decrypt($str, $syskey) { 
$str = base64_decode($str); 
$str = mcrypt_decrypt(MCRYPT_DES, $key, $str, MCRYPT_MODE_ECB); 
$block = mcrypt_get_block_size('des', 'ecb'); 
$pad = ord($str[($len = strlen($str)) - 1]); 
if ($pad && $pad < $block && preg_match('/' . chr($pad) . '{' . $pad . '}$/', $str)) { 
$str = substr($str, 0, strlen($str) - $pad); 
} 
return unserialize($str); 
} 
function getSubstr($str, $leftStr, $rightStr)
{
    $left = strpos($str, $leftStr);
    //echo '左边:'.$left;
    $right = strpos($str, $rightStr,$left);
    //echo '<br>右边:'.$right;
    if($left < 0 or $right < $left) return '';
    return substr($str, $left + strlen($leftStr), $right-$left-strlen($leftStr));
}
function getGTK2($skey){
		$salt = 5381;
		$md5key = 'tencentQQVIP123443safde&!%^%1282';
		$hash = array();
		$hash[] = ($salt << 5);
		$len = strlen($skey);
		for($i = 0; $i < $len; $i ++)
		{
			$ASCIICode = mb_convert_encoding($skey[$i], 'UTF-32BE', 'UTF-8');
			$ASCIICode = hexdec(bin2hex($ASCIICode));
			$hash[] = (($salt << 5) + $ASCIICode);
			$salt = $ASCIICode;
		}
		$md5str = md5(implode($hash) . $md5key);
		return $md5str;
	}
	function showmsg($con,$isurl = false,$url='/',$isgo = false,$die = true){
	if($isurl){
		$msg = "<script language='javascript'>alert('{$con}');window.location.href='{$url}';</script>";
		}else{
			$msg = "<script language='javascript'>alert('{$con}');</script>";
			}
	if($isgo){
		$msg = "<script language='javascript'>alert('{$con}');history.go(-1);</script>";
		}
	echo $msg;
	if($die == true){
		die ;
		}
	}
function C($name=null, $value=null,$default=null) {
    static $_config = array();
    // 无参数时获取所有
    if (empty($name)) {
        return $_config;
    }
    // 优先执行设置获取或赋值
    if (is_string($name)) {
        if (!strpos($name, '.')) {
            $name = strtoupper($name);
            if (is_null($value))
                return isset($_config[$name]) ? $_config[$name] : $default;
            $_config[$name] = $value;
            return;
        }
        // 二维数组设置和获取支持
        $name = explode('.', $name);
        $name[0]   =  strtoupper($name[0]);
        if (is_null($value))
            return isset($_config[$name[0]][$name[1]]) ? $_config[$name[0]][$name[1]] : $default;
        $_config[$name[0]][$name[1]] = $value;
        return;
    }
    // 批量设置
    if (is_array($name)){
        $_config = array_merge($_config, array_change_key_case($name,CASE_UPPER));
        return;
    }
    return null; // 避免非法参数
}


function load_config($table){
	$rows=$db->get_results("select * from {$table} where $tj limit $limit");
}

function safestr($str){
	if(!get_magic_quotes_gpc()){
		return addslashes($str);
	}else{
		return $str;
	}
}

function getip(){
	if (getenv("HTTP_CLIENT_IP") && strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown")) 
    	$ip = getenv("HTTP_CLIENT_IP"); 
	else if (getenv("HTTP_X_FORWARDED_FOR") && strcasecmp(getenv("HTTP_X_FORWARDED_FOR"), "unknown")) 
    	$ip = getenv("HTTP_X_FORWARDED_FOR"); 
	else if (getenv("REMOTE_ADDR") && strcasecmp(getenv("REMOTE_ADDR"), "unknown")) 
    	$ip = getenv("REMOTE_ADDR"); 
	else if (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], "unknown")) 
		$ip = $_SERVER['REMOTE_ADDR']; 
	else 
		$ip = "unknown";
	$ips=explode(', ',$ip);
	return $ip; 
}

function get_ip_city($ip)
{
    $url = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=';
    @$city = file_get_contents($url . $ip);
    $city = str_replace(array('var remote_ip_info = ', '};'), array('', '}'), $city);
    $city = json_decode($city, true);
    if ($city['city']) {
        $location = $city['city'];
    } else {
        $location = $city['province'];
    }
	if($location){
		return $location;
	}else{
		return;
	}
}

function get_count($table,$where='1=1',$key='*'){
	Global $db;
	$row=$db->get_row("select count($key) as count from ".C('DB_PREFIX')."{$table} where {$where}");
	$count = $row['count'];
    return $count;
}

function get_isvip($vip,$end){
	if($vip){
		if(strtotime($end)>time()){
			return 1;
		}else{
			return 0;
		}
	}else{
		return 0;
	}
}



function zhtime($time=''){
	if($time){
		return str_replace(array('2015-','0000-'),array('',''),$time);
	}else{
		return'00-00 00:00:00';
	}
}

function get_curl($url,$post=0,$referer=0,$cookie=0,$header=0,$ua=0,$nobaody=0){
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL,$url);
	if($post){
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
	}
	if($header){
		curl_setopt($ch, CURLOPT_HEADER, TRUE);
	}
	if($cookie){
		curl_setopt($ch, CURLOPT_COOKIE, $cookie);
	}
	if($referer){
		if($referer==1){
			curl_setopt($ch, CURLOPT_REFERER, "http://m.qzone.com/infocenter?g_f=");
		}else{
			curl_setopt($ch, CURLOPT_REFERER, $referer);
		}
	}
	if($ua){
		curl_setopt($ch, CURLOPT_USERAGENT,$ua);
	}else{
		curl_setopt($ch, CURLOPT_USERAGENT,'Mozilla/5.0 (Linux; U; Android 4.0.4; es-mx; HTC_One_X Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0');
	}
	if($nobaody){
		curl_setopt($ch, CURLOPT_NOBODY,1);//主要头部
		//curl_setopt($ch, CURLOPT_FOLLOWLOCATION,0);
	}
	curl_setopt($ch, CURLOPT_ENCODING, "gzip");
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
	$ret = curl_exec($ch);
	curl_close($ch);
	return $ret;
}

function uploadimg($uin,$sid,$image,$image_size=array()){
	$url="http://up.qzone.com/cgi-bin/upload/cgi_upload_pic_v2";
    $post="picture=".urlencode(base64_encode($image))."&base64=1&hd_height=".$image_size[1]."&hd_width=".$image_size[0]."&hd_quality=90&output_type=json&preupload=1&charset=utf-8&output_charset=utf-8&logintype=sid&Exif_CameraMaker=&Exif_CameraModel=&Exif_Time=&uin=".$uin."&sid=".$sid;
    $data=preg_replace("/\s/","",get_curl($url,$post));
	preg_match('/_Callback\((.*)\);/',$data,$arr);
	$data=json_decode($arr[1],true);
    if($data && array_key_exists('filemd5',$data)){
		$post="output_type=json&preupload=2&md5=".$data['filemd5']."&filelen=".$data['filelen']."&batchid=".time().rand(100000,999999)."&currnum=0&uploadNum=1&uploadtime=".time()."&uploadtype=1&upload_hd=0&albumtype=7&big_style=1&op_src=15003&charset=utf-8&output_charset=utf-8&uin=".$uin."&sid=".$sid."&logintype=sid&refer=shuoshuo";
		$img=preg_replace("/\s/","",get_curl($url,$post));
		preg_match('/_Callback\(\[(.*)\]\);/',$img,$arr);
		$data=json_decode($arr[1],true);
        if($data && array_key_exists('picinfo',$data)){
			if($data[picinfo][albumid]!=""){
				return "{$data['picinfo']['albumid']},{$data['picinfo']['lloc']},{$data['picinfo']['sloc']},{$data['picinfo']['type']},{$data['picinfo']['height']},{$data['picinfo']['width']},,,";
			}else{
				return'图片信息获取失败！';
			}
        }else{
            return'图片信息获取失败！';
        }
	}else{
		return'图片上传失败！原因：'.$data['msg'];
    }
}





