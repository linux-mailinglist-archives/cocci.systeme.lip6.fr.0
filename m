Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CEE41B89
	for <lists+cocci@lfdr.de>; Wed, 12 Jun 2019 07:26:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5C5PtX3011416;
	Wed, 12 Jun 2019 07:25:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C83AF7775;
	Wed, 12 Jun 2019 07:25:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 78EEE775F
 for <cocci@systeme.lip6.fr>; Wed, 12 Jun 2019 07:25:53 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5C5PrWd000423
 for <cocci@systeme.lip6.fr>; Wed, 12 Jun 2019 07:25:53 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,363,1557180000"; d="scan'208";a="386976829"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 07:25:52 +0200
Date: Wed, 12 Jun 2019 07:25:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Timur Tabi <timur@kernel.org>
In-Reply-To: <CAOZdJXVsdJHZyWSXzOsJTTOj8R=UZcD4yZVxXBB1TELJLT1wSA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1906120724230.2535@hadrien>
References: <CAOZdJXWVyC3o6vVbNEakhr8p4vX4j3wkkSyJg77-hcQ7Nqhf=g@mail.gmail.com>
 <CAOZdJXWja4mBf-gKSZ-HQaPs3c3x1ur2=BgPh6MnPx+eN7EgYQ@mail.gmail.com>
 <alpine.DEB.2.21.1905242138280.2514@hadrien>
 <CAOZdJXVsdJHZyWSXzOsJTTOj8R=UZcD4yZVxXBB1TELJLT1wSA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 12 Jun 2019 07:25:57 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 12 Jun 2019 07:25:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] How to concatenate identifier with text?
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



On Tue, 11 Jun 2019, Timur Tabi wrote:

> On Fri, May 24, 2019 at 2:38 PM Julia Lawall <julia.lawall@lip6.fr> wrote:
> > On Fri, 24 May 2019, Timur Tabi wrote:
> > > I figured it out:
> > >
> > > @@
> > > identifier func;
> > > fresh identifier label = func ## "_exit";
> >
> > Yes, that works too.  Simpler than my suggestion.
>
> I managed to break it somehow.  I suspect I ran into some other quirk
> of coccinelle.  I'm trying to convert that looks like this:
>
> x = MACRO1(stuff);
> if (x == NULL)
> {
>   BREAKPOINT();
>   status = ERROR;
>   goto myfunc_exit;
> }
>
> into:
> x = MACRO1(stuff);
> CHECK_OR_BP_AND_GOTO(x == NULL, status, ERROR, _exit);
>
> I thought this would work:
>
> @@
> type T;
> expression y, z;
> identifier x, s;
> identifier func;
> fresh identifier label = func ## "_exit";
> @@
> func(...) {
> <+...
>  x =
>  (T)
>  \(MACRO1\|MACRO2\)
>  (...);
> -if (y)
> -{
> -      BREAKPOINT();
> -      s = z;
> -      goto label;
> -}
> +CHECK_OR_BP_AND_GOTO(y, s, z, _exit);
> ...
>  label:
> ...+>
> }
>
> but I get this error:
>
> 18: unexpected use of a fresh identifier label
>
> What am I missing?

Fresh identifiers are only for + code.

You need to construct the identifier you want to match using python code,
as illustrated in demos/pythontococci.cocci

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
