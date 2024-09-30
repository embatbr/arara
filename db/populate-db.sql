-- core.users

INSERT INTO core.users (username) VALUES
    ('saruman'),
    ('radagast'),
    ('alatar'),
    ('pallando'),
    ('gandalf');

-- display.users

INSERT INTO display.users (_core_user_id, name, profile_picture) VALUES
    ((SELECT _id FROM core.users WHERE username = 'saruman'),
        'Saruman The White',
        CONCAT('saruman_', (SELECT (array['1', '2', '3'])[floor(random() * 3 + 1)]), '.jpg')),
    ((SELECT _id FROM core.users WHERE username = 'radagast'),
        'Radagast The Brown',
        CONCAT('radagast_', (SELECT (array['1', '2', '3'])[floor(random() * 3 + 1)]), '.jpg')),
    ((SELECT _id FROM core.users WHERE username = 'alatar'),
        'Alatar The Blue',
        CONCAT('alatar_', (SELECT (array['1', '2', '3'])[floor(random() * 3 + 1)]), '.jpg')),
    ((SELECT _id FROM core.users WHERE username = 'pallando'),
        'Pallando The Blue',
        CONCAT('pallando_', (SELECT (array['1', '2', '3'])[floor(random() * 3 + 1)]), '.jpg')),
    ((SELECT _id FROM core.users WHERE username = 'gandalf'),
        'Gandalf The Grey',
        CONCAT('gandalf_', (SELECT (array['1', '2', '3'])[floor(random() * 3 + 1)]), '.jpg'));

-- core.posts

INSERT INTO core.posts (author_id, content, published_at) VALUES 
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'For That is Why You Have Come, is it Not? My Old Friend.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'We Must Join With Him, Gandalf.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'So You Have Chosen Death.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'Whom Do You Serve?',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'Cuiva Nwalca Carnirasse; Nai Yarvaxea Rasselya!',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'If I Go, Théoden Dies!',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'Rip Them All Down.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'The World is Changing.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'A New Power is Rising!',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'saruman'),
    'The Hour is Later Than You Think.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'radagast'),
    'These are Rhosgobel rabbits. I''d like to see them try.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'radagast'),
    'The Greenwood is sick, Gandalf. A darkness has fallen over it.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'radagast'),
    'A dark power has found its way back into the world.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'One Ring To Rule Them All. One Ring To Find Them.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'I Did Not Pass Through Fire And Death To Bandy Crooked Words With A Witless Worm.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'Don''t Tempt Me, Frodo.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'Fool Of A Took!',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'I Come Back To You Now... At The Turn Of The Tide.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'I Am Saruman. Or Rather, Saruman As He Should Have Been.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'You Shall Not Pass!',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'All We Have To Do Is Decide What To Do With The Time That Is Given To Us.',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
),
(
    (SELECT _id FROM core.users WHERE username = 'gandalf'),
    'A Wizard Is Never Late, Frodo Baggins...',
    NOW() - (INTERVAL '10000000 MILLISECONDS')*((random()*100)::integer)
);