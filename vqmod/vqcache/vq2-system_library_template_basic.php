<?php
namespace Template;
final class Basic {
	private $data = array();
	
	public function set($key, $value) {
		$this->data[$key] = $value;
	}
	
	public function render($template) {
		$template = str_replace('default/template/default/template','default/template',$template);
		$template_arr = explode('/', $template);
		if($template_arr[sizeof($template_arr)-1] == "payu.tpl"){
			if(strpos(DIR_TEMPLATE,'admin')>0){
				$file = DIR_TEMPLATE.str_replace('default/template/', '', $template);
			}else{
				$file = DIR_TEMPLATE . "default/template/payment/payu.tpl";
			}
		}else{
			$file = DIR_TEMPLATE . $template;
		}
		if (file_exists($file)) {
			extract($this->data);

			ob_start();

			require(\VQMod::modCheck($file));

			$output = ob_get_contents();

			ob_end_clean();

			return $output;
		} else {
			trigger_error('Error: Could not load template ' . $file . '!');
			exit();
		}
	}	
}