Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6CF1099B1
	for <lists+cocci@lfdr.de>; Tue, 26 Nov 2019 08:48:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAQ7lxF6016739;
	Tue, 26 Nov 2019 08:47:59 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 94A4B77DE;
	Tue, 26 Nov 2019 08:47:59 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5063E77CC
 for <cocci@systeme.lip6.fr>; Tue, 26 Nov 2019 08:47:58 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAQ7lvHa008749
 for <cocci@systeme.lip6.fr>; Tue, 26 Nov 2019 08:47:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,244,1571695200"; d="scan'208";a="413491576"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 08:47:57 +0100
Date: Tue, 26 Nov 2019 08:47:56 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <51e6eb8b-ad70-b9b9-30da-8dd1c8bb8f82@web.de>
Message-ID: <alpine.DEB.2.21.1911260846230.2602@hadrien>
References: <alpine.DEB.2.21.1911252208260.2656@hadrien>
 <51e6eb8b-ad70-b9b9-30da-8dd1c8bb8f82@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 26 Nov 2019 08:47:59 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 26 Nov 2019 08:47:58 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Specifying conditional compilation with SmPL
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



--- Please note the new email address ---


On Tue, 26 Nov 2019, Markus Elfring wrote:

> > Coccinelle doesn't currently support adding ifdefs on expressions,
> > only on statements.
>
> Can the following transformation approach ever work
>
> @adjustment2@
> expression x;
> @@
> +#ifdef USE_F
>  f
> +#else
> +g
> +#endif
>  (x);

Obviously, it what was asked for would work, this would work too.  We're
not going to make a special case to exclude expressions that are
identifiers.  But the generated code would look horrible.

The reason for putting an ifdef on an expression would be that the
expression could appear in other contexts, such as conditional tests, not
to minimize the number of characters in the file.

julia

>
> in addition to this code variant for the semantic patch language?
>
> @adjustment1@
> expression x;
> @@
> +#ifdef USE_F
>  f(x);
> +#else
> +g(x);
> +#endif
>
>
> Regards,
> Markus
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
