# --
# Copyright (C) 2018 Perl-Services.de, http://perl-services.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::FilterContent::DisableOTRSBusinessNotification;

use strict;
use warnings;

our @ObjectDependencies = qw(
    Kernel::System::Web::Request
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    my $Action = $ParamObject->GetParam( Param => 'Action' ) // 'AgentDashboard';
    return 1 if !$Param{Templates}->{$Action};

    ${ $Param{Data} } =~ s{
        <option \s+ value=\\"Timeline\\" \s+ disabled [^>]+> [^<]+ </option>
    }{}xms;

    return 1;
}

1;
