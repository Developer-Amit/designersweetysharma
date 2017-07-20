<?php 
class ControllerModuleNilkanthinfoCms extends Controller {
	public function index($setting) {
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
			$data['html'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

			if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/module/nilkanthinfo_cms.tpl')) {
				return $this->load->view('module/nilkanthinfo_cms', $data);
			}
		}
	}
}