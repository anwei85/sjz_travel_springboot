CREATE TABLE IF NOT EXISTS REVIEW (
    id INT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(32) NOT NULL,
    target_id INT NOT NULL,
    target_type INT NOT NULL,
    rating INT NOT NULL,
    content VARCHAR(500) DEFAULT NULL,
    create_time DATETIME NOT NULL,
    state INT DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES USER(userid)
);

CREATE TABLE IF NOT EXISTS COLLECTION (
    id INT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(32) NOT NULL,
    target_id INT NOT NULL,
    target_type INT NOT NULL,
    create_time DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES USER(userid),
    UNIQUE KEY unique_user_target (user_id, target_id, target_type)
);