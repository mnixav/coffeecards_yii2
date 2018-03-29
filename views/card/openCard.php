<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 28.03.2018
 * Time: 15:54
 */

use yii\helpers\Html;

?>

<? $username = Html::encode($card->user['username']); ?>
<div class="col-xs-12 card" style="margin-bottom: 0 ">
    <div class="row">
        <div class="pull-left">
            <div class="card-author"><?=$username;?></div>
        </div>
        <div class="dropdown">
            <button type="button" class="close pull-right" data-dismiss="modal" aria-label="Close" style="padding: 0.5em 1em">
                <span aria-hidden="true">&times;</span>
            </button>
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
            <div style="word-wrap: break-word">
                <?if (!empty($card->description)):?>
                    <?= $username;?>:
                <?endif?>
                <span><?= Html::encode(base64_decode($card->description));?></span>
            </div>
            <div class="text-right"><?=date( "G:i j-M-Y", $card->date);?></div>
        </div>
    </div>
</div>
