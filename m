Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7B201B50
	for <lists+cocci@lfdr.de>; Fri, 19 Jun 2020 21:33:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05JJX2d2016492;
	Fri, 19 Jun 2020 21:33:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BD227781F;
	Fri, 19 Jun 2020 21:33:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8E8D1438E
 for <cocci@systeme.lip6.fr>; Fri, 19 Jun 2020 21:33:00 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05JJWxtL029511
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 19 Jun 2020 21:32:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,256,1589234400"; d="scan'208";a="455700223"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 21:32:59 +0200
Date: Fri, 19 Jun 2020 21:32:58 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20200619132307.16612-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2006192132410.2456@hadrien>
References: <20200619132307.16612-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 19 Jun 2020 21:33:04 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 19 Jun 2020 21:32:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: api/kstrdup: fix coccinelle position
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



On Fri, 19 Jun 2020, Denis Efremov wrote:

> There is a typo in rule r2. Position p1 should be attached to kzalloc()
> call.

Clearly.  Thanks.  Applied.

julia


>
> Fixes: 29a36d4dec6c ("scripts/coccinelle: improve the coverage of some semantic patches")
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  scripts/coccinelle/api/kstrdup.cocci | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coccinelle/api/kstrdup.cocci b/scripts/coccinelle/api/kstrdup.cocci
> index 19f2645e6076..3c6dc5469ee4 100644
> --- a/scripts/coccinelle/api/kstrdup.cocci
> +++ b/scripts/coccinelle/api/kstrdup.cocci
> @@ -66,7 +66,7 @@ position p1,p2;
>
>  *   x = strlen(from) + 1;
>      ... when != \( x = E1 \| from = E1 \)
> -*   to = \(kmalloc@p1\|kzalloc@p2\)(x,flag);
> +*   to = \(kmalloc@p1\|kzalloc@p1\)(x,flag);
>      ... when != \(x = E2 \| from = E2 \| to = E2 \)
>      if (to==NULL || ...) S
>      ... when != \(x = E3 \| from = E3 \| to = E3 \)
> --
> 2.26.2
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
