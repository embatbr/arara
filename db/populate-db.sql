-- core.users

INSERT INTO core.users (username) VALUES
    ('saruman'),
    ('radagast'),
    ('alatar'),
    ('pallando'),
    ('gandalf');

-- core.posts

INSERT INTO core.posts (author_id, content) VALUES 
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'For That is Why You Have Come, is it Not? My Old Friend.'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'We Must Join With Him, Gandalf.'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'So You Have Chosen Death.'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'Whom Do You Serve?'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'Cuiva Nwalca Carnirasse; Nai Yarvaxea Rasselya!'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'If I Go, Théoden Dies!'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'Rip Them All Down.'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'The World is Changing.'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'A New Power is Rising!'
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'The Hour is Later Than You Think.'
),
(
    (SELECT _id FROM core.users WHERE username = 'radagast'),
    'These are Rhosgobel rabbits. I''d like to see them try.'
),
(
    (SELECT _id FROM core.users WHERE username = 'radagast'),
    'The Greenwood is sick, Gandalf. A darkness has fallen over it.'
),
(
    (SELECT _id FROM core.users WHERE username = 'radagast'),
    'A dark power has found its way back into the world.'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'One Ring To Rule Them All. One Ring To Find Them.'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'I Did Not Pass Through Fire And Death To Bandy Crooked Words With A Witless Worm.'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'Don''t Tempt Me, Frodo.'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'Fool Of A Took!'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'I Come Back To You Now... At The Turn Of The Tide.'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'I Am Saruman. Or Rather, Saruman As He Should Have Been.'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'You Shall Not Pass!'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'All We Have To Do Is Decide What To Do With The Time That Is Given To Us.'
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'A Wizard Is Never Late, Frodo Baggins...'
);