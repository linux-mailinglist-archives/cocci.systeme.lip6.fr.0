Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D02C173A
	for <lists+cocci@lfdr.de>; Mon, 23 Nov 2020 22:07:17 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0ANL6jKv024430;
	Mon, 23 Nov 2020 22:06:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4D68D77A3;
	Mon, 23 Nov 2020 22:06:45 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 09C19454B
 for <cocci@systeme.lip6.fr>; Mon, 23 Nov 2020 22:06:43 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0ANL6gn2016298
 for <cocci@systeme.lip6.fr>; Mon, 23 Nov 2020 22:06:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,364,1599516000"; d="scan'208";a="479042964"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 22:06:42 +0100
Date: Mon, 23 Nov 2020 22:06:42 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
In-Reply-To: <20201118082705.ympf6ulol6wua4cl@adolin>
Message-ID: <alpine.DEB.2.22.394.2011232204550.2682@hadrien>
References: <20201118082705.ympf6ulol6wua4cl@adolin>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 23 Nov 2020 22:06:49 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 23 Nov 2020 22:06:42 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Gilles.Muller@lip6.fr, michal.lkml@markovi.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v2] scripts: coccicheck: Correct usage of make
 coccicheck
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Wed, 18 Nov 2020, Sumera Priyadarsini wrote:

> The command "make coccicheck C=1 CHECK=scripts/coccicheck" results in the
> error:
>         ./scripts/coccicheck: line 65: -1: shift count out of range
>
> This happens because every time the C variable is specified,
> the shell arguments need to be "shifted" in order to take only
> the last argument, which is the C file to test. These shell arguments
> mostly comprise flags that have been set in the Makefile. However,
> when coccicheck is specified in the make command as a rule, the
> number of shell arguments is zero, thus passing the invalid value -1
> to the shift command, resulting in an error.
>
> Modify coccicheck to print correct usage of make coccicheck so as to
> avoid the error.
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
> Changes in v2:
> - Move test to only display error message
> ---
>  scripts/coccicheck | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 209bb0427b43..f3b8bf505c5f 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -61,6 +61,18 @@ COCCIINCLUDE=${COCCIINCLUDE// -include/ --include}
>  if [ "$C" = "1" -o "$C" = "2" ]; then
>      ONLINE=1
>
> +    if [[ $# -le 0 ]]; then
> +	    echo ''
> +	    echo 'Specifying both the variable "C" and rule "coccicheck" in the make
> +command results in a shift count error.'
> +	    echo ''
> +	    echo 'Try specifying "scripts/coccicheck" as a value for the CHECK variable instead.'
> +	    echo ''
> +	    echo 'Example:	make C=2 CHECK=scripts/coccicheck drivers/staging/wfx/hi_t.o'

I think that this file doesn't exist any more.  Even though you can't
guarantee that any particular file will be around forever, a file in
staging is probably not a good choice, since they are usually on their way
in or on the way out of the kernel.

julia

> +	    echo ''
> +	    exit 1
> +    fi
> +
>      # Take only the last argument, which is the C file to test
>      shift $(( $# - 1 ))
>      OPTIONS="$COCCIINCLUDE $1"
> --
> 2.25.1
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
