Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C42F26325
	for <lists+cocci@lfdr.de>; Wed, 22 May 2019 13:47:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4MBkUXs012237;
	Wed, 22 May 2019 13:46:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A512F7759;
	Wed, 22 May 2019 13:46:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 054E77747
 for <cocci@systeme.lip6.fr>; Wed, 22 May 2019 13:46:29 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4MBkSGf010793
 for <cocci@systeme.lip6.fr>; Wed, 22 May 2019 13:46:28 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,499,1549926000"; d="scan'208";a="384250991"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 13:37:11 +0200
Date: Wed, 22 May 2019 13:37:10 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <86fdc128-e077-58d1-2170-912937317ab1@linbit.com>
Message-ID: <alpine.DEB.2.20.1905221330110.4390@hadrien>
References: <86fdc128-e077-58d1-2170-912937317ab1@linbit.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-806269077-1558524727=:4390"
Content-ID: <alpine.DEB.2.20.1905221332100.4390@hadrien>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 22 May 2019 13:46:30 +0200 (CEST)
X-Greylist: Delayed for 00:09:17 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Wed, 22 May 2019 13:46:28 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Does coccinelle support non-standard C?
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

--8323329-806269077-1558524727=:4390
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.20.1905221332101.4390@hadrien>



On Wed, 22 May 2019, Christoph Böhmwalder wrote:

> Hi,
>
> Consider the following snippet of C:
>
>
> #define f() ({ puts("hello"); 0; })
> int main()
> {
>     printf("%d\n", f());
> }
>
>
> It uses an expression statement in the definition of `f`, which is a gcc
> extension.
>
> Now let's try to write a semantic patch to generate something like this:
>
>
> @@
> @@
> - cocci_replace_this()
> + ({ puts("hello"); 0; })
>
>
> With the C code as:
>
>
> #define f() cocci_replace_this()
> int main()
> {
>     printf("%d\n", f());
> }
>
>
> This prompts the following error message from spatch:
>
>
> $ spatch --sp-file test.cocci test.c
> init_defs_builtins: /usr/lib/coccinelle/standard.h
> 32 33
> Fatal error: exception Failure("plus: parse error: \n = File \"test.cocci\",
> line 4, column 3,  charpos = 32\n    around = '{', whole content = + ({
> puts(\"hello\"); 0; })\n")
>
>
> Now here's my question: this obviously implies that coccinelle doesn't support
> expression statements (or any other non-standard C for that matter).

The C parser should parse such statements.  I think it is indeed likely
that the semantic patch parser doesn't support them.  I wouldn't go as far
as saying that the semantic patch parser doesn't support any non-standard
C.  It pretty much supports what people have asked for, when there didn't
seem to be a workaround.

> Can I
> still somehow tell spatch to just replace it with this string of text instead
> of trying to parse it as C?

Is it always exactly this string that you want to add?

julia
--8323329-806269077-1558524727=:4390
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-806269077-1558524727=:4390--
