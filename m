Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D53C3688
	for <lists+cocci@lfdr.de>; Sat, 10 Jul 2021 21:50:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 16AJo7PK001685;
	Sat, 10 Jul 2021 21:50:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 083F377F8;
	Sat, 10 Jul 2021 21:50:07 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1A7994065
 for <cocci@systeme.lip6.fr>; Sat, 10 Jul 2021 21:50:05 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 16AJo4iT001485
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 10 Jul 2021 21:50:04 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AcsgFQanE6Aoxn2NF0+kPcN/ywVnpDfI13DAb?=
 =?us-ascii?q?v31ZSRFFG/Fw9vrAoB1173HJYVoqMk3I+urtBED/ewK+yXcd2+B4AV7IZmLbUQ?=
 =?us-ascii?q?WTQb2Kl7GD/9SaIUzDytI=3D?=
X-IronPort-AV: E=Sophos;i="5.84,229,1620684000"; d="scan'208";a="519326321"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 21:50:04 +0200
Date: Sat, 10 Jul 2021 21:50:04 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2107102149140.46528@hadrien>
References: <08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 10 Jul 2021 21:50:09 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 10 Jul 2021 21:50:04 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kernel-janitors@vger.kernel.org, cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] cocci script to convert linux-kernel allocs with
 BITS_TO_LONGS to bitmap_alloc
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



On Fri, 9 Jul 2021, Joe Perches wrote:

> Here is a cocci script to convert various types of bitmap allocations
> that use BITS_TO_LONGS to the more typical bitmap_alloc functions.
>
> Perhaps something like it could be added to scripts/coccinelle.
> The diff produced by the script is also below.
>
> $ cat bitmap_allocs.cocci
> // typical uses of bitmap allocations
>
> @@
> expression val;
> expression e1;
> expression e2;
> @@
>
> -	val = kcalloc(BITS_TO_LONGS(e1), sizeof(\(long\|unsigned long\)), e2)
> +	val = bitmap_zalloc(e1, e2)
>
> @@
> expression val;
> expression e1;
> expression e2;
> @@
>
> -	val = kcalloc(BITS_TO_LONGS(e1), sizeof(*val), e2)
> +	val = bitmap_zalloc(e1, e2)

Is there something that guarantees that val has a type that has a size that
is the same as a long?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
