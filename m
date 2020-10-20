Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 103B628A136
	for <lists+cocci@lfdr.de>; Sat, 10 Oct 2020 21:28:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09AJRS6R010432;
	Sat, 10 Oct 2020 21:27:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 138BE77BF;
	Sat, 10 Oct 2020 21:27:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7599C578C
 for <cocci@systeme.lip6.fr>; Sat, 10 Oct 2020 21:27:23 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09AJRM6P017347
 for <cocci@systeme.lip6.fr>; Sat, 10 Oct 2020 21:27:22 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,360,1596492000"; d="scan'208";a="471939804"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2020 21:27:22 +0200
Date: Sat, 10 Oct 2020 21:27:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20201009125453.31217-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2010102127100.2691@hadrien>
References: <20201009125453.31217-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 10 Oct 2020 21:27:30 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 10 Oct 2020 21:27:22 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: api: kfree_sensitive: print memset
 position
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



On Fri, 9 Oct 2020, Denis Efremov wrote:

> Print memset() call position in addition to the kfree() position to
> ease issues identification.
>
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied, thanks.

julia

> ---
>  scripts/coccinelle/api/kfree_sensitive.cocci | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/coccinelle/api/kfree_sensitive.cocci b/scripts/coccinelle/api/kfree_sensitive.cocci
> index e4a066a0b77d..8d980ebf3223 100644
> --- a/scripts/coccinelle/api/kfree_sensitive.cocci
> +++ b/scripts/coccinelle/api/kfree_sensitive.cocci
> @@ -85,14 +85,16 @@ type T;
>
>  @script:python depends on report@
>  p << r.p;
> +m << r.m;
>  @@
>
> -coccilib.report.print_report(p[0],
> -  "WARNING: opportunity for kfree_sensitive/kvfree_sensitive")
> +msg = "WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line %s)"
> +coccilib.report.print_report(p[0], msg % (m[0].line))
>
>  @script:python depends on org@
>  p << r.p;
> +m << r.m;
>  @@
>
> -coccilib.org.print_todo(p[0],
> -  "WARNING: opportunity for kfree_sensitive/kvfree_sensitive")
> +msg = "WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line %s)"
> +coccilib.org.print_todo(p[0], msg % (m[0].line))
> --
> 2.26.2
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
