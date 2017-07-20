<?php
class ControllerNilkanthinfoNISetting extends Controller {
    public function index() {
        $this->load->language('nilkanthinfo/ni_setting'); 
		$data['templatepath'] = $this->config->get('theme_default_directory'); 				//By Nilkanthinfo
  
        $data['heading_title'] = $this->language->get('heading_title'); // set the heading_title of the module
		
		
		
		$data['font_color_option'] = html_entity_decode($this->config->get('default_font_color_option')); 
		
		$data['theme_sub_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_sub_color')); 
		$data['theme_sub_color_option_rgba'] = implode(", ", $this->hex2rgb($data['theme_sub_color_option']));
		
		$data['theme_main_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_main_color')); 
		$data['theme_main_color_option_rgba'] = implode(", ", $this->hex2rgb($data['theme_main_color_option']));
		
		$data['theme_footer_top_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_footer_top_color')); 
		$data['theme_footer_middle_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_footer_middle_color')); 
		$data['theme_footer_bottom_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_footer_bottom_color')); 
		$data['theme_footer_text_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_footer_text_color')); 
		$data['theme_footer_text_hover_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_footer_text_hover_color')); 
		$data['theme_text_hover_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_text_hover_color')); 		
		
		$data['theme_text_color_option'] = html_entity_decode($this->config->get('default_fontcolor_theme_text_color')); 
		
	
				     
        if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/nilkanthinfo/ni_setting.tpl')) {
			return $this->load->view('nilkanthinfo/ni_setting', $data);
		}
		

    }
	
	public function hex2rgb($hex) {
		$hex = str_replace("#", "", $hex);
		
		if(strlen($hex) == 3) {
		$r = hexdec(substr($hex,0,1).substr($hex,0,1));
		$g = hexdec(substr($hex,1,1).substr($hex,1,1));
		$b = hexdec(substr($hex,2,1).substr($hex,2,1));
		} else {
		$r = hexdec(substr($hex,0,2));
		$g = hexdec(substr($hex,2,2));
		$b = hexdec(substr($hex,4,2));
		}
		$rgb = array($r, $g, $b);
		
		return $rgb; // returns an array with the rgb values
		}
}
?>
 