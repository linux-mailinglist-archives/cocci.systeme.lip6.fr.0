Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA380632
	for <lists+cocci@lfdr.de>; Sat,  3 Aug 2019 14:45:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x73Ciio6020722;
	Sat, 3 Aug 2019 14:44:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1398677A1;
	Sat,  3 Aug 2019 14:44:44 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A5B0A778D
 for <cocci@systeme.lip6.fr>; Sat,  3 Aug 2019 14:44:42 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x73Cigdv010151
 for <cocci@systeme.lip6.fr>; Sat, 3 Aug 2019 14:44:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,342,1559512800"; d="scan'208";a="394333845"
Received: from 71-219-63-70.chvl.qwest.net (HELO hadrien) ([71.219.63.70])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Aug 2019 14:44:41 +0200
Date: Sat, 3 Aug 2019 08:44:40 -0400 (EDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <b4c91fb8-5606-c06e-e349-5415458cf3b5@linbit.com>
Message-ID: <alpine.DEB.2.21.1908030841460.2547@hadrien>
References: <b4c91fb8-5606-c06e-e349-5415458cf3b5@linbit.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1690826410-1564836282=:2547"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 03 Aug 2019 14:44:44 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sat, 03 Aug 2019 14:44:42 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Make rule depend on comment
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1690826410-1564836282=:2547
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 2 Aug 2019, Christoph Böhmwalder wrote:

> Hi,
>
> I have a question regarding the new "comments" feature. Suppose the following:
>
> test.cocci
> ----------
> @ r @
> identifier fn;
> comments c;
> @@
> fn()@c
> {
> }
>
> @ script:python @
> fn << r.fn;
> c << r.c;
> @@
> print(fn + " has comment: " + c[0].after)
>
>
> test.c
> ------
> int f() /* a comment */ { }
> int g() { }
>
>
> spatch --sp-file test.cocci test.c
> ----------------------------------
> f has comment: /* a comment */
> g has comment:
>
>
> The issue here is that I would like to trigger the python script
> (i.e. satisfy the "r" rule) iff the comment is actually present.
> Can I make the rule depend on the comment being there?

A choice could have been to let c only match if there is a comment in at
least one place (before, within, or after).  I don't know if that would be
desirable.

But in your case, would it suffice just to put an if in the python code?
Or is it essential that the first rule actually not match?

julia

>
> Thanks,
>
> --
> Christoph Böhmwalder
> LINBIT | Keeping the Digital World Running
> DRBD HA —  Disaster Recovery — Software defined Storage
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1690826410-1564836282=:2547
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1690826410-1564836282=:2547--
