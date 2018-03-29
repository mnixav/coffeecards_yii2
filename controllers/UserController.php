<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 24.03.2018
 * Time: 12:02
 */

namespace app\controllers;


use app\models\Profile;
use yii\base\ErrorException;
use yii\web\Controller;
use app\models\LoginForm;
use app\models\RegisterForm;
use Yii;

class UserController extends Controller {

    public function actionLogin() {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goHome();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    public function actionRegister() {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $modelRegister = new RegisterForm();
        if ($modelRegister->load(Yii::$app->request->post()) && $modelRegister->register()) {

            $modelLogin = new LoginForm();
            $modelLogin->username = $modelRegister->username;
            $modelLogin->password = $modelRegister->password;

            if ($modelLogin->login()) {
                return $this->render('successfulRegister');
            } else {
                throw new ErrorException('Что-то пошло не так');
            }
        }

        return $this->render('register', ['model' => $modelRegister,]);

    }

    public function actionProfile() {
        if (Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new Profile();
        if ($model->load(Yii::$app->request->post()) && $model->saveSettings()) {
            return $this->refresh();
        }
        $model->getOldSettings();
        $model->getCards();
        return $this->render('profile', ['model' => $model]);
    }

}