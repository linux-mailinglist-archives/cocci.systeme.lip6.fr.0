Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080D23CBD8
	for <lists+cocci@lfdr.de>; Wed,  5 Aug 2020 17:55:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 075FtZev022522;
	Wed, 5 Aug 2020 17:55:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 32A2E77BC;
	Wed,  5 Aug 2020 17:55:35 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 520394084
 for <cocci@systeme.lip6.fr>; Wed,  5 Aug 2020 17:55:33 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 075FtWgT018256
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 5 Aug 2020 17:55:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,438,1589234400"; d="scan'208";a="462549311"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 17:55:32 +0200
Date: Wed, 5 Aug 2020 17:55:32 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
In-Reply-To: <20200805085740.9263-1-sylphrenadin@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2008051755210.2536@hadrien>
References: <20200805085740.9263-1-sylphrenadin@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 05 Aug 2020 17:55:36 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 05 Aug 2020 17:55:32 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: michal.lkml@markovi.net, Gilles.Muller@lip6.fr, gregkh@linuxfoundation.org,
        nicolas.palix@imag.fr, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v2] scripts: coccicheck: Add chain mode to list
 of	modes
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



On Wed, 5 Aug 2020, Sumera Priyadarsini wrote:

> This patch adds chain mode to the list of available modes in coccicheck.

Applied, Thanks!

julia

>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
> Changes in v2:
> 	- Change coccinelle to coccicheck as suggested by Julia Lawall.
> ---
>  scripts/coccicheck | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index e04d328210ac..6e37cf36caae 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -99,7 +99,7 @@ fi
>  if [ "$MODE" = "" ] ; then
>      if [ "$ONLINE" = "0" ] ; then
>  	echo 'You have not explicitly specified the mode to use. Using default "report" mode.'
> -	echo 'Available modes are the following: patch, report, context, org'
> +	echo 'Available modes are the following: patch, report, context, org, chain'
>  	echo 'You can specify the mode with "make coccicheck MODE=<mode>"'
>  	echo 'Note however that some modes are not implemented by some semantic patches.'
>      fi
> --
> 2.17.1
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
