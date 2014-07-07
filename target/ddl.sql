
    drop table admin cascade constraints;

    drop table album cascade constraints;

    drop table artist cascade constraints;

    drop table playlist cascade constraints;

    drop table playlist_tracks cascade constraints;

    drop table registered_user cascade constraints;

    drop table track cascade constraints;

    drop sequence hibernate_sequence;

    create table admin (
        id number(19,0) not null,
        version number(19,0) not null,
        primary key (id)
    );

    create table album (
        id number(19,0) not null,
        version number(19,0) not null,
        file_payload long raw,
        name varchar2(255 char) not null,
        primary key (id)
    );

    create table artist (
        id number(19,0) not null,
        version number(19,0) not null,
        name varchar2(255 char) not null,
        primary key (id)
    );

    create table playlist (
        id number(19,0) not null,
        version number(19,0) not null,
        primary key (id)
    );

    create table playlist_tracks (
        track_id number(19,0) not null,
        playlist_id number(19,0) not null,
        primary key (playlist_id, track_id)
    );

    create table registered_user (
        id number(19,0) not null,
        version number(19,0) not null,
        primary key (id)
    );

    create table track (
        id number(19,0) not null,
        version number(19,0) not null,
        album_id number(19,0) not null,
        artist_id number(19,0) not null,
        disc number(10,0) not null,
        file_payload long raw,
        title varchar2(255 char) not null,
        track number(10,0) not null,
        uploader_id number(19,0) not null,
        primary key (id)
    );

    alter table playlist_tracks 
        add constraint FK_c80quucgl9w5yhoa9ikmlxh7l 
        foreign key (playlist_id) 
        references playlist;

    alter table playlist_tracks 
        add constraint FK_of5xweu2srr829ibu91dfpoqm 
        foreign key (track_id) 
        references track;

    alter table track 
        add constraint FK_7a3b1nfa8axtakmqir6q7y07 
        foreign key (album_id) 
        references album;

    alter table track 
        add constraint FK_gqwc4d2lj6lem9g0uho8v7ous 
        foreign key (artist_id) 
        references artist;

    alter table track 
        add constraint FK_p8jidg3fhc91d2f9dnhi1e1di 
        foreign key (uploader_id) 
        references registered_user;

    create sequence hibernate_sequence;
