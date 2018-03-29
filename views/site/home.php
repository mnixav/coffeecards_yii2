<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

$this->title = 'Последние публикации';
$this->params['breadcrumbs'][] = $this->title;
$this->params['homeLink'] = false;

?>
<div class="site-home">
    <div class="body-content">
        <? foreach ($model->cards as $card): ?>
            <? $username = Html::encode($card->user['username']); ?>
            <div class="col-lg-offset-3 col-lg-6 card">
                <div class="row">
                    <div class="pull-left">
                        <div class="card-author"><?=$username;?></div>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle card-head-button pull-right" type="button" id="dropdownMenu1"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                            <? if ($card->user_id == Yii::$app->user->identity->getId()):?>
                                <li><a href="#">Редактировать</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Удалить</a></li>
                            <? else : ?>
                                <li><a href="#">Публикации <?=$username;?></a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Скрыть</a></li>
                            <? endif ?>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <img class="img-responsive" style="width: 100%" src="/web/cards/<?=$card->img?>">
                    <div class="card-footer">
                        <?if (!empty($card->description)):?>
                            <div style="word-wrap: break-word">
                                <?= $username;?>:
                                <span><?= Html::encode(base64_decode($card->description));?></span>
                            </div>
                        <?endif?>
                        <div class="text-right"><?=date( "G:i j-M-Y", $card->date);?></div>
                    </div>
                </div>
            </div>
        <? endforeach ?>
    </div>
</div>
