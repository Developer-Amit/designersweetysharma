<?php 
class ControllerNilkanthinfoNiSetting extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('nilkanthinfo/ni_setting');

		$this->document->setTitle($this->language->get('heading_title'));
		
		
		$this->document->addScript('view/javascript/nilkanthinfo/jscolor/jscolor.js');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				
			$this->model_setting_setting->editSetting('default_font', $this->request->post);
		
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_theme_main_color'] = $this->language->get('entry_theme_main_color');
		$data['entry_theme_sub_color'] = $this->language->get('entry_theme_sub_color');
		$data['entry_theme_footer_top_color'] = $this->language->get('entry_theme_footer_top_color');
		$data['entry_theme_footer_middle_color'] = $this->language->get('entry_theme_footer_middle_color');
		$data['entry_theme_footer_bottom_color'] = $this->language->get('entry_theme_footer_bottom_color');
		$data['entry_theme_footer_text_color'] = $this->language->get('entry_theme_footer_text_color');
		$data['entry_theme_footer_text_hover_color'] = $this->language->get('entry_theme_footer_text_hover_color');
		$data['entry_theme_text_hover_color'] = $this->language->get('entry_theme_text_hover_color');
		$data['entry_theme_text_color'] = $this->language->get('entry_theme_text_color');
		
      
			
		$data['entry_theme_color'] = $this->language->get('entry_theme_color');
		$data['entry_customize_theme'] = $this->language->get('entry_customize_theme');
		$data['entry_default_theme'] = $this->language->get('entry_default_theme');
		
		$data['entry_right_click'] = $this->language->get('entry_right_click');
		$data['help_right_click'] = $this->language->get('help_right_click');
		
		$data['entry_right_click_message'] = $this->language->get('entry_right_click_message');
		$data['help_right_click_message'] = $this->language->get('help_right_click_message');
		
		
		$data['option_on'] = $this->language->get('option_on');
		$data['option_off'] = $this->language->get('option_off');
	
        $data['error_body_color'] = $this->language->get('error_body_color');
		$data['error_heading_color'] = $this->language->get('error_heading_color');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		
		$data['tab_color'] = $this->language->get('tab_color');
		$data['tab_sample'] = $this->language->get('tab_sample');
		$data['tab_compress'] = $this->language->get('tab_compress');
		$data['tab_general'] = $this->language->get('tab_general');
		$data['sample_data'] = $this->language->get('sample_data');
		$data['compress_data'] = $this->language->get('compress_data');


		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		
		
		if (isset($this->request->post['default_font_right_click'])) {
			$data['default_font_right_click'] = $this->request->post['default_font_right_click'];
		} else {
			$data['default_font_right_click'] = $this->config->get('default_font_right_click');
		}
		
				
		
		
		
		if (isset($this->request->post['default_font_color_option'])) {
			$data['default_font_color_option'] = $this->request->post['default_font_color_option'];
		} else  if (!isset($this->request->post['default_font_color_option'])) {
			$data['default_font_color_option'] = $this->config->get('default_font_color_option');
		} 
		else{
			$data['default_font_color_option'] = 'default';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_main_color'])) {
		  $data['default_fontcolor_theme_main_color'] = $this->request->post['default_fontcolor_theme_main_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_main_color'])) {
            $data['default_fontcolor_theme_main_color'] = $this->config->get('default_fontcolor_theme_main_color');
        } else{
			$data['default_fontcolor_theme_main_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_sub_color'])) {
		  $data['default_fontcolor_theme_sub_color'] = $this->request->post['default_fontcolor_theme_sub_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_sub_color'])) {
            $data['default_fontcolor_theme_sub_color'] = $this->config->get('default_fontcolor_theme_sub_color');
        } else{
			$data['default_fontcolor_theme_sub_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_footer_top_color'])) {
		  $data['default_fontcolor_theme_footer_top_color'] = $this->request->post['default_fontcolor_theme_footer_top_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_footer_top_color'])) {
            $data['default_fontcolor_theme_footer_top_color'] = $this->config->get('default_fontcolor_theme_footer_top_color');
        } else{
			$data['default_fontcolor_theme_footer_top_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_footer_middle_color'])) {
		  $data['default_fontcolor_theme_footer_middle_color'] = $this->request->post['default_fontcolor_theme_footer_middle_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_footer_middle_color'])) {
            $data['default_fontcolor_theme_footer_middle_color'] = $this->config->get('default_fontcolor_theme_footer_middle_color');
        } else{
			$data['default_fontcolor_theme_footer_middle_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_footer_bottom_color'])) {
		  $data['default_fontcolor_theme_footer_bottom_color'] = $this->request->post['default_fontcolor_theme_footer_bottom_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_footer_bottom_color'])) {
            $data['default_fontcolor_theme_footer_bottom_color'] = $this->config->get('default_fontcolor_theme_footer_bottom_color');
        } else{
			$data['default_fontcolor_theme_footer_bottom_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_footer_text_color'])) {
		  $data['default_fontcolor_theme_footer_text_color'] = $this->request->post['default_fontcolor_theme_footer_text_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_footer_text_color'])) {
            $data['default_fontcolor_theme_footer_text_color'] = $this->config->get('default_fontcolor_theme_footer_text_color');
        } else{
			$data['default_fontcolor_theme_footer_text_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_footer_text_hover_color'])) {
		  $data['default_fontcolor_theme_footer_text_hover_color'] = $this->request->post['default_fontcolor_theme_footer_text_hover_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_footer_text_hover_color'])) {
            $data['default_fontcolor_theme_footer_text_hover_color'] = $this->config->get('default_fontcolor_theme_footer_text_hover_color');
        } else{
			$data['default_fontcolor_theme_footer_text_hover_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_text_hover_color'])) {
		  $data['default_fontcolor_theme_text_hover_color'] = $this->request->post['default_fontcolor_theme_text_hover_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_text_hover_color'])) {
            $data['default_fontcolor_theme_text_hover_color'] = $this->config->get('default_fontcolor_theme_text_hover_color');
        } else{
			$data['default_fontcolor_theme_text_hover_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_fontcolor_theme_text_color'])) {
		  $data['default_fontcolor_theme_text_color'] = $this->request->post['default_fontcolor_theme_text_color'];
        } else  if (!isset($this->request->post['default_fontcolor_theme_text_color'])) {
            $data['default_fontcolor_theme_text_color'] = $this->config->get('default_fontcolor_theme_text_color');
        } else{
			$data['default_fontcolor_theme_text_color'] = 'ffffff';	
		}
		
		if (isset($this->request->post['default_font_right_click_message'])) {
		  $data['default_font_right_click_message'] = $this->request->post['default_font_right_click_message'];
        } else  if (!isset($this->request->post['default_font_right_click_message'])) {
            $data['default_font_right_click_message'] = $this->config->get('default_font_right_click_message');
        } 
		
	
		
		  

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = '';
		}

		

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_stores'),
			'href' => $this->url->link('nilkanthinfo/ni_setting', 'token=' . $this->session->data['token'], true)
		);

		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action'] = $this->url->link('nilkanthinfo/ni_setting', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);
		
		$data['link_sample_data'] = $this->url->link('nilkanthinfo/ni_setting/install_sample', 'token=' . $this->session->data['token'], true);

		$data['token'] = $this->session->data['token'];

		
		if (isset($this->request->post['config_meta_title'])) {
			$data['config_meta_title'] = $this->request->post['config_meta_title'];
		} else {
			$data['config_meta_title'] = $this->config->get('config_meta_title');
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['theme'] = $this->config->get('theme_default_directory');
		
		$this->response->setOutput($this->load->view('nilkanthinfo/ni_setting', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'nilkanthinfo/ni_setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

	
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}
	
	public function install_sample()
	{

		$this->load->model('nilkanthinfo/ni_sample');
		$this->model_nilkanthinfo_ni_sample->install();
		$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
	}

}