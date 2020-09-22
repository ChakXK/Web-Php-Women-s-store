<?php
class ControllerExtensionModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->language('extension/module/banner');
		$data['text_look'] = $this->language->get('text_look');
		$data['text_soon'] = $this->language->get('text_soon');
		$text_slogan = $this->language->get('text_slogan');

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if ($result['title'] == ''){$result['title']=$text_slogan;}
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' =>  $result['title'] ,
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/slideshow', $data);
	}
}
