#!/usr/bin/env perl

use strict;
use warnings;
use Cinnamon::DSL;

role local => [qw(local.prepan.org)], {
    user => 'vagrant',
};

role redis => [qw(redis-1.us-west-1)], {
    user => 'ec2-user',
};

role app   => [qw(app-1.us-west-1 app-2.us-west-1)], {
    user => 'ec2-user',
};

task chef => {
    prepare => sub {
        my ($host, @args) = @_;
        my $user = get('user');

        run "knife", "solo", "prepare", "$user\@$host", "-c", "config/knife.rb", "-i", "~/.ssh/prepan.pem", "-F", "~/.ssh/config"
    },

    cook => sub {
        my ($host, @args) = @_;
        my $user = get('user');

        run "knife", "solo", "cook", "$user\@$host", "-c", "config/knife.rb", "-i", "~/.ssh/prepan.pem", "-F", "~/.ssh/config"
    },
};
