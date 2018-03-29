<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 27.03.2018
 * Time: 17:28
 */

use yii\bootstrap\ActiveForm;
use yii\helpers\Html;

$this->title = 'Новая публикация';
$this->params['breadcrumbs'][] = $this->title;
$this->params['homeLink'] = ['label' => 'Главная', 'url' => '/user/login'];
?>

<div class="form-addCard col-lg-offset-1" style="padding-top: 25px">
    <?php $form = ActiveForm::begin([
        'id' => 'setting-form',
        'layout' => 'horizontal',
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-4\">{input}</div>\n<div class=\"col-lg-5\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-3 control-label'],
        ],
    ]); ?>


    <?= $form->field($model, 'photo', ['template'=> "        
        <div class='col-lg-offset-3 col-lg-4 vcenter control-label'>
            <div class='glyphicon glyphicon-camera' style='font-size: 150%; padding-bottom: 0.4em' >&nbsp;</div>
            {label}
        </div>
        {input}
        <div class='col-lg-5'>{error}</div>
        ", 'labelOptions' => ['class' => 'btn-link']])->fileInput(['id' => 'file-upload', 'style' => 'display: none']) ?>

    <?= $form->field($model, 'description')->textarea() ?>

    <div class="form-group">
        <div class="col-lg-offset-3 col-lg-8">
            <?= Html::submitButton('Опубликовать', ['class' => 'btn btn-primary', 'name' => 'save-button']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</div>