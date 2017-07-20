<?php
class ControllerModuleFilter extends Controller {
	public function index() {
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$category_id = end($parts);

		$this->load->model('catalog/category');

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->load->language('module/filter');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['button_filter'] = $this->language->get('button_filter');
			$data['price_tag'] = $this->language->get('price_tag');
			$data['price_range'] = $this->language->get('price_range');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));

			if (isset($this->request->get['filter'])) {
				$data['filter_category'] = explode(',', $this->request->get['filter']);
			} else {
				$data['filter_category'] = array();
			}
			
			/*Edited by NI*/
			
			$this->load->model('catalog/product');
			$res=$this->model_catalog_product->getProducts();
			foreach($res as $ress)
			{
				if(!$ress['special']){
					$prc[]=$this->tax->calculate($ress['price'], $ress['tax_class_id'], $this->config->get('config_tax'));
		
				}else{				
					$prc[]= $this->tax->calculate($ress['special'], $ress['tax_class_id'], $this->config->get('config_tax'));
				}
			}
			
				$data['min_m'] = min($prc);
				$data['max_m'] = max($prc);
 			
			
			$data['min_m']=$this->currency->convert($data['min_m'],'INR',$this->session->data['currency'] );
			$data['max_m']=$this->currency->convert($data['max_m'],'INR',$this->session->data['currency']);
			
			
			$data['cur_symbol'] = ''; 
			if($this->currency->getSymbolRight($this->session->data['currency'] )!='')
			{
				$data['cur_symbol'] = $this->currency->getSymbolRight($this->session->data['currency'] ); 
			}
			else
			{
				$data['cur_symbol'] = $this->currency->getSymbolLeft($this->session->data['currency'] ); 
			}
			
			if (isset($this->request->get['min'])) {
				$data['min'] = $this->request->get['min'];
			} else {
				$data['min'] = $data['min_m'];
			}
			
			if (isset($this->request->get['max'])) {
				$data['max'] = $this->request->get['max'];
			} else {
				$data['max'] = $data['max_m'];
			}
			
			/*------------------*/

			$this->load->model('catalog/product');

			$data['filter_groups'] = array();

			$filter_groups = $this->model_catalog_category->getCategoryFilters($category_id);

			//if ($filter_groups) {
				foreach ($filter_groups as $filter_group) {
					$childen_data = array();

					foreach ($filter_group['filter'] as $filter) {
						$filter_data = array(
							'filter_category_id' => $category_id,
							'filter_filter'      => $filter['filter_id']
						);

						$childen_data[] = array(
							'filter_id' => $filter['filter_id'],
							'name'      => $filter['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
						);
					}

					$data['filter_groups'][] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $childen_data
					);
				}

				return $this->load->view('module/filter', $data);
			//}
		}
	}
}