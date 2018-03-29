<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 27.03.2018
 * Time: 17:24
 */

namespace app\controllers;


use app\models\AddCard;
use app\models\Card;
use yii\web\Controller;
use yii\web\UploadedFile;
use Yii;

class CardController extends Controller {

    public function actionAdd(){
        if (Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new AddCard();

        if (Yii::$app->request->isPost) {
            $model->load(Yii::$app->request->post());
            $model->photo = UploadedFile::getInstance($model, 'photo');
            if ($model->add()) {
                return $this->redirect('/user/profile');
            }
        }

        return $this->render('addCard', ['model'=> $model]);
    }

    public function actionOpen($id) {
        /*if (Yii::$app->user->isGuest or !Yii::$app->request->isAjax) {
            return $this->goHome();
        }*/

        $card = Card::findOne($id);
        return $this->renderPartial('openCard', ['card' => $card]);

    }

}