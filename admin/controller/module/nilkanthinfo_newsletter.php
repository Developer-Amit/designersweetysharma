<?php

class ControllerModuleNilkanthinfoNewsletter extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('module/nilkanthinfo_newsletter');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');

		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				
			$results = $this->model_extension_module->getModulesByCode('nilkanthinfo_newsletter');
			$total_module=sizeOf($results);
			if ($total_module==0) {
				$this->model_extension_module->addModule('nilkanthinfo_newsletter', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}
 
        

        $data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
			
	/*	$data['entry_name'] = $this->language->get('entry_name');*/

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_content_top'] = $this->language->get('text_content_top');
        $data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $data['text_column_left'] = $this->language->get('text_column_left');
        $data['text_column_right'] = $this->language->get('text_column_right');

      $data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		
        $data['entry_status'] = $this->language->get('entry_status');
		/*$data['entry_description'] = $this->language->get('entry_description');*/
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_popup'] = $this->language->get('entry_popup');
		$data['entry_heading'] = $this->language->get('entry_heading');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_lefttop'] = $this->language->get('entry_lefttop');
		$data['entry_leftcenter'] = $this->language->get('entry_leftcenter');
		$data['entry_leftbottom'] = $this->language->get('entry_leftbottom');
		
		$data['entry_centertop'] = $this->language->get('entry_centertop');
		$data['entry_centercenter'] = $this->language->get('entry_centercenter');
		$data['entry_centerbottom'] = $this->language->get('entry_centerbottom');
		
		$data['entry_righttop'] = $this->language->get('entry_righttop');
		$data['entry_rightcenter'] = $this->language->get('entry_rightcenter');
		$data['entry_rightbottom'] = $this->language->get('entry_rightbottom');
		
		
		$data['entry_repeat'] = $this->language->get('entry_repeat');
		$data['entry_repeatopt'] = $this->language->get('entry_repeatopt');
		$data['entry_norepeat'] = $this->language->get('entry_norepeat');
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
			
      
        $data['button_save'] = $this->language->get('button_save');
        $data['button_nll'] = $this->language->get('button_nll');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_add_module'] = $this->language->get('button_add_module');
        $data['button_remove'] = $this->language->get('button_remove');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
		
		
	/*	if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
*/

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'], true),
            'separator' => ' :: '
        );

      		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

        $data['modules'] = array();
		
			if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		/*if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}*/
		
		
		
		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = '';
		}
		
		
	
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		/*if (isset($this->request->post['popup_description'])) {
			$data['popup_description'] = $this->request->post['popup_description'];
		} elseif (!empty($module_info)) {
			$data['popup_description'] = $module_info['popup_description'];
		} else {
			$data['popup_description'] = '';
		}
		*/
		
			
		foreach($data['languages'] as $language)
		{
			
			if (isset($this->request->post['module_description'][$language['language_id']]['image'])) {
				$data['image'][$language['language_id']] = $this->request->post['module_description'][$language['language_id']]['image'];
			} elseif (!empty($module_info['module_description'][$language['language_id']]['image'])) {
				$data['image'][$language['language_id']] = $module_info['module_description'][$language['language_id']]['image'];
			} else {
				$data['image'][$language['language_id']] = '';
			}
			
			$this->load->model('tool/image');
	
			if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['module_description'][$language['language_id']]['image'])) {
				$data['thumb'][$language['language_id']] = $this->model_tool_image->resize($this->request->post['module_description'][$language['language_id']]['image'], 100, 100);
			} elseif (!empty($module_info['module_description'][$language['language_id']]['image']) && is_file(DIR_IMAGE . $module_info['module_description'][$language['language_id']]['image'])) {
				$data['thumb'][$language['language_id']] = $this->model_tool_image->resize($module_info['module_description'][$language['language_id']]['image'], 100, 100);
			} else {
				$data['thumb'][$language['language_id']] = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
	
			$data['placeholder'][$language['language_id']] = $this->model_tool_image->resize('no_image.png', 100, 100);
			
			if (isset($this->request->post['module_description'][$language['language_id']]['is_popup'])) {
				$data['is_popup'][$language['language_id']] = $this->request->post['module_description'][$language['language_id']]['is_popup'];
			} elseif (isset($module_info['module_description'][$language['language_id']]['is_popup'])) {
				$data['is_popup'][$language['language_id']] = $module_info['module_description'][$language['language_id']]['is_popup'];
			} else {
				$data['is_popup'][$language['language_id']] = 'off';
			}
			
			if (isset($this->request->post['module_description'][$language['language_id']]['heading'])) {
				$data['heading'][$language['language_id']] = $this->request->post['module_description'][$language['language_id']]['heading'];
			} elseif (isset($module_info['module_description'][$language['language_id']]['heading'])) {
				$data['heading'][$language['language_id']] = $module_info['module_description'][$language['language_id']]['heading'];
			} else {
				$data['heading'][$language['language_id']] = 'Newsletter Subscription';
			}
			
			if (isset($this->request->post['module_description'][$language['language_id']]['description'])) {
				$data['description'][$language['language_id']] = $this->request->post['module_description'][$language['language_id']]['description'];
			} elseif (isset($module_info['module_description'][$language['language_id']]['description'])) {
				$data['description'][$language['language_id']] = $module_info['module_description'][$language['language_id']]['description'];
			} else {
				$data['description'][$language['language_id']] = '';
			}
			
			if (isset($this->request->post['module_description'][$language['language_id']]['position'])) {
				$data['position'][$language['language_id']] = $this->request->post['module_description'][$language['language_id']]['position'];
			} elseif (isset($module_info['module_description'][$language['language_id']]['position'])) {
				$data['position'][$language['language_id']] = $module_info['module_description'][$language['language_id']]['position'];
			} else {
				$data['position'][$language['language_id']] = '';
			}
			
			if (isset($this->request->post['module_description'][$language['language_id']]['repeat'])) {
				$data['repeat'][$language['language_id']] = $this->request->post['module_description'][$language['language_id']]['repeat'];
			} elseif (isset($module_info['module_description'][$language['language_id']]['repeat'])) {
				$data['repeat'][$language['language_id']] = $module_info['module_description'][$language['language_id']]['repeat'];
			} else {
				$data['repeat'][$language['language_id']] = '';
			}
			
			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
			} elseif (!empty($module_info)) {
				$data['status'] = $module_info['status'];
			} else {
				$data['status'] = '';
			}
		}



        if (isset($this->request->post['nilkanthinfo_newsletter_module'])) {
            $data['modules'] = $this->request->post['nilkanthinfo_newsletter_module'];
        } elseif ($this->config->get('nilkanthinfo_newsletter_module')) {
            $data['modules'] = $this->config->get('nilkanthinfo_newsletter_module');
        }

        $this->load->model('design/layout');

        $data['layouts'] = $this->model_design_layout->getLayouts();
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/nilkanthinfo_newsletter', $data));

      
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/nilkanthinfo_newsletter')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
		
		

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function install() {
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'nilkanthinfo/nilkanthinfo_newsletter' );
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/nilkanthinfo_newsletter' );
		
        $this->load->model('nilkanthinfo/nilkanthinfo_newsletter');
        $this->model_nilkanthinfo_nilkanthinfo_newsletter->createDatabaseTables();
    }

    public function uninstall() {
		$this->load->model('user/user_group');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'nilkanthinfo/nilkanthinfo_newsletter' );
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/nilkanthinfo_newsletter' );
		
        $this->load->model('nilkanthinfo/nilkanthinfo_newsletter');
        $this->model_nilkanthinfo_nilkanthinfo_newsletter->dropDatabaseTables();
    }

}

?>