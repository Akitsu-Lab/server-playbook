USE soto;

-- accounts テーブルにサンプルデータを挿入
INSERT INTO accounts (account_name, balance) VALUES
('John', 1000),
('Smith', 500),
('Brown', 1500);

-- events テーブルにサンプルデータを挿入
INSERT INTO events (option_count, winning_number, prize_money, is_selling, end_sale_date) VALUES
(5, 3, 1000000, TRUE, '2025-02-28 23:59:59'),
(4, 2, 500000, TRUE, '2025-02-15 23:59:59'),
(6, 5, 2000000, FALSE, '2025-01-31 23:59:59');

-- purchases テーブルにサンプルデータを挿入
INSERT INTO purchases (event_id, account_id, selected_number, is_winner) VALUES
(1, 1, 3, TRUE),
(1, 2, 1, FALSE),
(2, 3, 2, TRUE),
(3, 1, 5, FALSE);

