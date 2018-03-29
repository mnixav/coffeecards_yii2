<?php
namespace app\commands;

use Yii;
use yii\console\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = \Yii::$app->authManager;

        $authorPermission = $auth->createPermission('doAuthorAction');
        $authorPermission->description = 'Do author action';
        $auth->add($authorPermission);

        $adminPermission = $auth->createPermission('doAdminAction');
        $adminPermission->description = 'Do admin action';
        $auth->add($adminPermission);

        $author = $auth->createRole('author');
        $auth->add($author);
        $auth->addChild($author, $authorPermission);

        $admin = $auth->createRole('admin');
        $auth->add($admin);
        $auth->addChild($admin, $author);
        $auth->addChild($admin, $adminPermission);

    }
}