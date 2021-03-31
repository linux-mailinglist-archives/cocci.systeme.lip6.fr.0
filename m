Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15E3482B9
	for <lists+cocci@lfdr.de>; Wed, 24 Mar 2021 21:17:21 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12OKGYWj005340;
	Wed, 24 Mar 2021 21:16:34 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DA3AC77E3;
	Wed, 24 Mar 2021 21:16:33 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EB30D3E8A
 for <cocci@systeme.lip6.fr>; Wed, 24 Mar 2021 21:16:31 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12OKGVeU024792
 for <cocci@systeme.lip6.fr>; Wed, 24 Mar 2021 21:16:31 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Agtl5mq0h1werp35a+9f/ogqjBFMkLtp033Aq?=
 =?us-ascii?q?2lEZdDV+dMuEm8ey2MkKzBOcskd0ZFgMkc2NUZPqfVry7phwiLN6AZ6DW03ctH?=
 =?us-ascii?q?KsPMVe6+LZogHIPw3b2qpj2bx7c654YeeAaGRSqcrh+gG3H5IB7bC8kJyAvuvV?=
 =?us-ascii?q?w3dzQQwCUcgJ0y5DBgmWCUFwTgVdbKBJd6a03NZNpDarZB0sAPiTO39tZYT+ju?=
 =?us-ascii?q?HQmImjSRALAANP0njtsRqYrI+/KRSe0xsEOgkj/Z4p+wH+/DDE2g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,275,1610406000"; d="scan'208";a="376775116"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 21:16:30 +0100
Date: Wed, 24 Mar 2021 21:16:30 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20210308191215.1362498-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2103242116040.7838@hadrien>
References: <20210308191215.1362498-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 24 Mar 2021 21:16:36 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 24 Mar 2021 21:16:31 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: misc: restrict patch mode in
 flexible_array.cocci
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



On Mon, 8 Mar 2021, Denis Efremov wrote:

> Skip patches generation for structs/unions with a single field.
> Changing a zero-length array to a flexible array member in a struct
> with no named members breaks the compilation. However, reporting
> such cases is still valuable, e.g. commit 637464c59e0b
> ("ACPI: NFIT: Fix flexible_array.cocci warnings").
>
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied.  I changed the log message to remove "/unions", since the change
doesn't mention unions.

julia

> ---
>  scripts/coccinelle/misc/flexible_array.cocci | 23 ++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/coccinelle/misc/flexible_array.cocci b/scripts/coccinelle/misc/flexible_array.cocci
> index 947fbaff82a9..f427fd68ed2d 100644
> --- a/scripts/coccinelle/misc/flexible_array.cocci
> +++ b/scripts/coccinelle/misc/flexible_array.cocci
> @@ -51,21 +51,40 @@ position p : script:python() { relevant(p) };
>    };
>  )
>
> +@only_field depends on patch@
> +identifier name, array;
> +type T;
> +position q;
> +@@
> +
> +(
> +  struct name {@q
> +    T array[0];
> +  };
> +|
> +  struct {@q
> +    T array[0];
> +  };
> +)
> +
>  @depends on patch@
>  identifier name, array;
>  type T;
>  position p : script:python() { relevant(p) };
> +// position @q with rule "only_field" simplifies
> +// handling of bitfields, arrays, etc.
> +position q != only_field.q;
>  @@
>
>  (
> -  struct name {
> +  struct name {@q
>      ...
>      T array@p[
>  -       0
>      ];
>    };
>  |
> -  struct {
> +  struct {@q
>      ...
>      T array@p[
>  -       0
> --
> 2.26.2
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
