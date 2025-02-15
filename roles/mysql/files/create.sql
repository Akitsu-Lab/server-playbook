-- sotoデータベースがある場合は削除
DROP DATABASE IF EXISTS soto;

-- message_boardデータベース作成
CREATE DATABASE soto;

USE soto;

-- accountsテーブル作成
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    account_name VARCHAR(255) NOT NULL UNIQUE,
    balance INT DEFAULT 5000,                           -- 残高
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,      -- 作成した日時を自動入力
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 更新した日時を自動入力 https://dev.mysql.com/doc/refman/8.0/ja/timestamp-initialization.html
);

-- eventsテーブル作成
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,      -- 開催回のID (主キー)
    option_count INT NOT NULL,                     -- 選択肢の数
    winning_number INT DEFAULT NULL,                   -- 当選番号
    prize_money INT NOT NULL,                      -- 当選金額
    is_selling BOOLEAN NOT NULL DEFAULT TRUE,      -- 販売中かどうか
    end_sale_date DATETIME,                         -- 販売終了日時
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 作成した日時を自動入力
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 更新した日時を自動入力 https://dev.mysql.com/doc/refman/8.0/ja/timestamp-initialization.html
);

-- purchasesテーブル作成
CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,   -- 購入ID (主キー)
    event_id INT NOT NULL,                        -- 開催回のID（外部キー）
    account_id INT NOT NULL,                      -- 購入者アカウントID（外部キー）
    selected_number INT NOT NULL,                 -- 購入した番号
    is_winner BOOLEAN NOT NULL DEFAULT FALSE,     -- 当選したかどうか
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 作成した日時を自動入力
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 更新した日時を自動入力 https://dev.mysql.com/doc/refman/8.0/ja/timestamp-initialization.html
    FOREIGN KEY (event_id) REFERENCES events(event_id), -- 外部キー（開催回）
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)    -- 外部キー（アカウント）
);
