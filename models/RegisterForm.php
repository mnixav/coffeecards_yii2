<?php

namespace app\models;

use Yii;
use yii\base\Model;


class RegisterForm extends Model
{
    public $username;
    public $password;
    public $password_repeat;

    private $_user = false;

    public function rules()
    {
        return [
            [['username', 'password', 'password_repeat'], 'required'],
            ['username', 'usernameIsFree'],
            ['username', 'match', 'pattern' => '/^[a-z0-9_]+$/i'],
            ['username', 'string', 'length' => [5, 20]],
            ['password', 'match', 'pattern' => '/^[ёа-яa-z0-9_]+$/i'],
            ['password', 'string', 'length' => [6, 20]],
            ['password_repeat', 'compare', 'compareAttribute' => 'password'],
        ];
    }

    public function attributeLabels() {
        return [
            'username' => 'Имя пользователя',
            'password' => 'Пароль',
            'password_repeat' => 'Повторите пароль',
            ];
    }

    public function usernameIsFree($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();

            if($user){
                $this->addError($attribute, 'Такой пользователь уже существует');
            }
        }
    }


    public function register()
    {
        if ($this->validate()) {
            $newUser = new User();
            $newUser->username = $this->username;
            $newUser->password = Yii::$app->getSecurity()->generatePasswordHash($this->password);

            $auth = Yii::$app->authManager;
            $authorRole = $auth->getRole('author');
            return $newUser->save() and $auth->assign($authorRole, $newUser->getId());
        }
        return false;
    }

    public function getUser()
    {
        if ($this->_user === false) {
            $this->_user = User::findByUsername($this->username);
        }
        return $this->_user;
    }
}
