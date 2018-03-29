<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 24.03.2018
 * Time: 15:10
 */

use yii\bootstrap\ActiveForm;
use \yii\helpers\Html;
use yii\helpers\Url;

$this->title = 'Мой профиль';
$this->params['breadcrumbs'][] = $this->title;
$this->params['homeLink'] = ['label' => 'Главная', 'url' => '/user/login'];

//инициализация подсказок Tooltip
$script = <<< JS
    $(function () { 
      $("[data-toggle='tooltip']").tooltip(); 
    });
JS;
$this->registerJs($script);
$this->registerJsFile('@web/js/dynamicModalWindow.js', ['depends' => 'yii\web\YiiAsset']);
?>


<div>
    <!-- Навигационные вкладки -->
    <ul class="nav nav-pills" role="tablist" style="border-bottom: 1px solid #dddddd; padding-bottom: 5px; margin-bottom: 5px">
        <li role="presentation" class="active"><a href="#publication" aria-controls="publication" role="tab" data-toggle="tab">Публикации</a></li>
        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Настройки</a></li>
    </ul>

    <!-- Вкладки панелей -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="publication">
            <div class="row" style="margin: 0; padding-bottom: 5px">
                <a role="button" class="btn btn-default pull-right" href="<?=Url::to('/card/add')?>">Добавить</a>
            </div>
            <div class="row center-block">
                <?if(!empty($model->cards)):?>
                    <?foreach ($model->cards as $card):?>
                        <div class="col-lg-3  col-xs-4 image-min-div">
                            <!--<a data-toggle="modal" data-target="#openCardModal" data-card_id="<?/*=$card->id*/?>">-->
                            <a class="card-button" data-card_id="<?=$card->id?>" style="cursor: pointer">
                                <img src="/web/cards/thumbnail/<?=$card->img?>" class="image-min" style="width: 100%">
                            </a>
                        </div>
                    <?endforeach;?>
                <?else:?>
                    <div class="jumbotron">Здесь будут показаны ваши публикации</div>
                <?endif;?>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="settings">
            <div class="profile-setting col-lg-offset-1" style="padding-top: 15px">
                <?php $form = ActiveForm::begin([
                    'id' => 'setting-form',
                    'layout' => 'horizontal',
                    'fieldConfig' => [
                        'template' => "{label}\n<div class=\"col-lg-4\">{input}</div>\n<div class=\"col-lg-5\">{error}</div>",
                        'labelOptions' => ['class' => 'col-lg-3 control-label'],
                    ],
                ]); ?>

                <?= $form->field($model, 'username')->textInput(['readOnly'=> true])?>
                <?= $form->field($model, 'new_password')->passwordInput() ?>
                <?= $form->field($model, 'email')->textInput() ?>
                <?= $form->field($model, 'name')->textInput() ?>
                <?= $form->field($model, 'friendsOnly')->checkbox([
                    'template' => "
                    <div class=\"col-lg-offset-3 col-lg-7\">{input} {label}
                        <button type=\"button\" class=\"btn-link\" data-toggle=\"tooltip\" 
                        data-placement=\"right\" title=\"Оставляет в вашей ленте только ваши публикации\">
                            <span class='glyphicon glyphicon-question-sign'></span>
                        </button>
                    </div>\n
                    <div class=\"col-lg-1\">{error}</div>",
                ]) ?>
                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-8">
                        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-primary', 'name' => 'save-button']) ?>
                    </div>
                </div>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
    <div class="modal fade" id="openCardModal" tabindex="-1" role="dialog" aria-labelledby="Modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content row">
                <div class="modal-body1"></div>
            </div>
        </div>
    </div>
</div>
