<?php

class ControllerShippingnexpress extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('shipping/nexpress');

        //$this->document->title = $this->language->get('heading_title');
	  $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('nexpress', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect(HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token']);
        }

        // установка языковых переменных
        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_all_zones'] = $this->language->get('text_all_zones');
        $this->data['text_none'] = $this->language->get('text_none');

        $this->data['entry_tax'] = $this->language->get('entry_tax');
        $this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $this->data['entry_delivery_price'] = $this->language->get('entry_delivery_price');
        $this->data['entry_min_total_for_free_delivery'] = $this->language->get('entry_min_total_for_free_delivery');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        $this->data['tab_general'] = $this->language->get('tab_general');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        // хлебные крошки
        $this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_shipping'),
			'href'      => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('shipping/nexpress', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

        // ссылки для кнопок Сохранить и Отменить
        $this->data['action'] = HTTPS_SERVER . 'index.php?route=shipping/nexpress&token=' . $this->session->data['token'];

        $this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'];

        if (isset($this->request->post['nexpress_min_total_for_free_delivery'])) {
            $this->data['nexpress_min_total_for_free_delivery'] = $this->request->post['nexpress_min_total_for_free_delivery'];
        } else {
            $this->data['nexpress_min_total_for_free_delivery'] = $this->config->get('nexpress_min_total_for_free_delivery');
        }

        if (isset($this->request->post['nexpress_delivery_price'])) {
            $this->data['nexpress_delivery_price'] = $this->request->post['nexpress_delivery_price'];
        } else {
            $this->data['nexpress_delivery_price'] = $this->config->get('nexpress_delivery_price');
        }

        if (isset($this->request->post['nexpress_geo_zone_id'])) {
            $this->data['nexpress_geo_zone_id'] = $this->request->post['nexpress_geo_zone_id'];
        } else {
            $this->data['nexpress_geo_zone_id'] = $this->config->get('nexpress_geo_zone_id');
        }

        if (isset($this->request->post['nexpress_status'])) {
            $this->data['nexpress_status'] = $this->request->post['nexpress_status'];
        } else {
            $this->data['nexpress_status'] = $this->config->get('nexpress_status');
        }

        if (isset($this->request->post['nexpress_sort_order'])) {
            $this->data['nexpress_sort_order'] = $this->request->post['nexpress_sort_order'];
        } else {
            $this->data['nexpress_sort_order'] = $this->config->get('nexpress_sort_order');
        }

        $this->load->model('localisation/geo_zone');

        $this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        $this->template = 'shipping/nexpress.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'shipping/nexpress')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

}

?>