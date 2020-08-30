Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6D256FBB
	for <lists+cocci@lfdr.de>; Sun, 30 Aug 2020 20:41:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07UIfDPr017832;
	Sun, 30 Aug 2020 20:41:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A06F077BC;
	Sun, 30 Aug 2020 20:41:13 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9C25B3F6C
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 20:41:11 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07UIfBfP015605
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 20:41:11 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="465271086"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2020 20:41:10 +0200
Date: Sun, 30 Aug 2020 20:41:10 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <7ce009d5f538feae7a6a20e0bbecdf73d74ea9f9.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2008302039000.3629@hadrien>
References: <de28becbfe76575b18c0bf47567b7f9c20f15f87.camel@perches.com>
 <alpine.DEB.2.22.394.2008300854510.3629@hadrien>
 <b43fac2f903451dba4d5f4ac010b2ae5bfcad0c4.camel@perches.com>
 <alpine.DEB.2.22.394.2008301021250.3629@hadrien> 
 <bc3215bbf6c217a06dc2ebbf6ddd977c5d57654c.camel@perches.com>
 <alpine.DEB.2.22.394.2008301742400.3629@hadrien>
 <7ce009d5f538feae7a6a20e0bbecdf73d74ea9f9.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 30 Aug 2020 20:41:14 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 30 Aug 2020 20:41:11 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] transform oddity / bug ?
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



On Sun, 30 Aug 2020, Joe Perches wrote:

> On Sun, 2020-08-30 at 17:46 +0200, Julia Lawall wrote:
> > The following:
> >
> > @not_int_not_len exists@
> > type T != int;
> > identifier x != len;
> > position p;
> > identifier sysfs =~ "^sysfs_emit.*$";
> > assignment operator aop;
> > @@
> >
> > T@p x;
> > ...
> > x aop sysfs(...)
> >
> > @@
> > type not_int_not_len.T;
> > identifier not_int_not_len.x;
> > position not_int_not_len.p;
> > @@
> >
> > (
> > - T@p x;
> > + int len;
> > - T@p x
> > + int len
> >  = ...;
> > )
> >   <...
> > - x
> > + len
> >   ...>
> >
> > works on the following test file:
> >
> > int fn1()
> > {
> >         ssize_t count = 0;
> >         count += sysfs_emit_at(buf, count, ...);
> >         return count;
> > }
> >
> > int fn2()
> > {
> >         ssize_t count;
> >         count += sysfs_emit_at(buf, count, ...);
> > 	return count;
> > }
> >
> > In the first rule, T@p x; benefits from an isomorphism to get the
> > initialization case.  That is not possible in the second rule, because the
> > name of the declared variable is modified.
>
> Unfortunately this does not work when the declaration
> is comma terminated and not semicolon terminated.

I will have to look into it.  It should handle this sort of thing, but it
is somewhat complex, because the declarations have to be split and this
specific case may not be handled.

One thing that is possible is to change only the variable name.  If there
are not many occurrences, one could fix them up afterwards by hand.

julia

>
>
> $ cat julia.c
> int fn1()
> {
>         ssize_t count = 0, another;	// <- multiple declarations
>         count += sysfs_emit_at(buf, count, ...);
>         return count;
> }
>
> int fn2()
> {
>         ssize_t count;
>         count += sysfs_emit_at(buf, count, ...);
>         return count;
> }
>
> $ spatch -sp-file julia.cocci julia.c
> init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
> HANDLING: julia.c
> diff =
> --- julia.c
> +++ /tmp/cocci-output-77064-888900-julia.c
> @@ -7,8 +7,8 @@ int fn1()
>
>  int fn2()
>  {
> -        ssize_t count;
> -        count += sysfs_emit_at(buf, count, ...);
> -        return count;
> +        int len;
> +        len += sysfs_emit_at(buf, count, ...);
> +        return len;
>  }
>
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
