# -*- Mode: perl; indent-tabs-mode: nil -*-
#
# The contents of this file are subject to the Mozilla Public
# License Version 1.1 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy of
# the License at http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
# implied. See the License for the specific language governing
# rights and limitations under the License.
#
# The Original Code is the Bugzilla Example Plugin.
#
# The Initial Developer of the Original Code is Canonical Ltd.
# Portions created by Canonical Ltd. are Copyright (C) 2008
# Canonical Ltd. All Rights Reserved.
#
# Contributor(s): Max Kanat-Alexander <mkanat@bugzilla.org>
#                 Bradley Baetz <bbaetz@acm.org>

package Bugzilla::Extension::FieldVisibility::ConfigFieldVisibility;
use strict;
use warnings;

use Data::Dumper;

use Bugzilla::Config::Common;

sub get_param_list {
    my ($class) = @_;

    my @param_list = (
                      {
                         name    => 'hide__version',
                         desc    => 'Bug Severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      },
                      {
                         name    => 'hide__platform',
                         desc    => 'Other Severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      },
                      {
                         name    => 'hide__target_milestone',
                         desc    => 'Other Severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      },
                      {
                         name    => 'hide__url',
                         desc    => 'Other Severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      },
                      {
                         name    => 'hide__whiteboard',
                         desc    => 'Other Severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      },
                      {
                         name    => 'hide__keyword',
                         desc    => 'Other Severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      },
                      {
                         name    => 'hide__cf_occurence',
                         desc    => 'Other Severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      },
                      {
                         name    => 'hide__cf_operator',
                         desc    => 'Target milestones depending on bug severities',
                         type    => 'm',
                         choices => \&_get_bug_severites,
                         default => [],
                      }
                     );

    return @param_list;
}

sub _get_bug_severites {
    # Returns all the possible severities.

    my $dbh = Bugzilla->dbh;

    my $severities = $dbh->selectcol_arrayref(
        "SELECT DISTINCT value
                                             FROM bug_severity    
                                             WHERE bug_severity.isactive = 1
                                             ORDER BY sortkey"
                                             );

    return \@{$severities};
}

1;
