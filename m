Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCE1094F1
	for <lists+cocci@lfdr.de>; Mon, 25 Nov 2019 22:10:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAPLAWEN015160;
	Mon, 25 Nov 2019 22:10:32 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C518A77DD;
	Mon, 25 Nov 2019 22:10:32 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 521F177B5
 for <cocci@systeme.lip6.fr>; Mon, 25 Nov 2019 22:10:31 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAPLAUuN022027
 for <cocci@systeme.lip6.fr>; Mon, 25 Nov 2019 22:10:30 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,242,1571695200"; d="scan'208";a="327974082"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 22:10:30 +0100
Date: Mon, 25 Nov 2019 22:10:30 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: David Frey <dpfrey@gmail.com>
In-Reply-To: <c156dbfc-8c3d-4750-fa90-2bbd11060130@gmail.com>
Message-ID: <alpine.DEB.2.21.1911252208260.2656@hadrien>
References: <c156dbfc-8c3d-4750-fa90-2bbd11060130@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 25 Nov 2019 22:10:36 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 25 Nov 2019 22:10:30 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Problem writing simple patch
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

On Mon, 25 Nov 2019, David Frey wrote:

> Hi,
>
> I'm trying to write a .cocci file to transform all calls to a function
> "f(ex)" to something like this:
>
> #ifdef USE_F
> f(ex)
> #else
> g(ex)
> #endif
>
> The function has this signature:
> bool f(int x);
>
> This is the patch that I tried to use:
> @@
> expression ex;
> @@
> +#ifdef USE_F
>  f(ex)
> +#else
> +g(ex)
> +#endif
>
>
> This is the result of running it:
> $ spatch --show-c --sp-file test.cocci test.c
> init_defs_builtins: /usr/bin/../lib/coccinelle/standard.h
> plus: parse error:
>   File "test.cocci", line 7, column 1, charpos = 50
>   around = 'g',
>   whole content = +g(ex)
>
> What is wrong with the patch above?

Coccinelle doesn't currently support adding ifdefs on expressions, only on
statements.

You could try for some typical usage contexts, like

+ifdef...
x = f(ex);
+#else
+x = g(ex);
+#endif

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
