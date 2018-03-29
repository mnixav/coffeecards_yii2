<?php
return [
    'doAuthorAction' => [
        'type' => 2,
        'description' => 'Do author action',
    ],
    'doAdminAction' => [
        'type' => 2,
        'description' => 'Do admin action',
    ],
    'author' => [
        'type' => 1,
        'children' => [
            'doAuthorAction',
        ],
    ],
    'admin' => [
        'type' => 1,
        'children' => [
            'author',
            'doAdminAction',
        ],
    ],
];
