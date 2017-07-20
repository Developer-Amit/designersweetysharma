<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		//Edited By Nilkanthinfo for Category navigation
		
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
					
					
					// Level 3
					
						$child3_data = array();

						$children_3 = $this->model_catalog_category->getCategories($child['category_id']);
		
						foreach ($children_3 as $child3) {
							$data3 = array(
								'filter_category_id'  => $child3['category_id'],
								'filter_sub_category' => true
							);
						
		
							$product_total1 = $this->model_catalog_product->getTotalProducts($data3);
		
							$child3_data[] = array(
								'category_id' => $child3['category_id'],
								'name'  => $child3['name'] ,
								'href'  => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $child3['category_id'])
								
								);	
						}
					// End Level 3
							
					$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name'  => $child['name'] ,
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						'total_product' => $product_total,
						'children3' => $child3_data
					);
				}
					//end 3 layer menu
				// Level 1
				$data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
				
				
			}
			
		}
		
		//End Category Navigation
		return $this->load->view('module/category', $data);
	}
}