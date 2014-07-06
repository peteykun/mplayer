
    drop table album cascade constraints;

    drop table artist cascade constraints;

    drop table track cascade constraints;

    drop sequence hibernate_sequence;

    create table album (
        id number(19,0) not null,
        version number(19,0) not null,
        primary key (id)
    );

    create table artist (
        id number(19,0) not null,
        version number(19,0) not null,
        name varchar2(255 char) not null,
        primary key (id)
    );

    create table track (
        id number(19,0) not null,
        version number(19,0) not null,
        primary key (id)
    );

    create sequence hibernate_sequence;
