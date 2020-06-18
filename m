Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84F1FF695
	for <lists+cocci@lfdr.de>; Thu, 18 Jun 2020 17:26:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05IFQ0rd022598;
	Thu, 18 Jun 2020 17:26:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C2FD8781F;
	Thu, 18 Jun 2020 17:26:00 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E0ABA402B
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 17:25:58 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05IFPwf3019346
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 17:25:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,251,1589234400"; d="scan'208";a="455443046"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 17:25:58 +0200
Date: Thu, 18 Jun 2020 17:25:58 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Johannes Berg <johannes@sipsolutions.net>
In-Reply-To: <63bfef4128a756c9e5abc1f8d5637443162f0530.camel@sipsolutions.net>
Message-ID: <alpine.DEB.2.22.394.2006181724411.2367@hadrien>
References: <812b3a31097815244e0f929552819ac1f119f5a0.camel@sipsolutions.net>
 <alpine.DEB.2.22.394.2006172314450.3083@hadrien>
 <dfd11c78ef60afd3dd45097e9bf738499f608867.camel@sipsolutions.net>
 <63bfef4128a756c9e5abc1f8d5637443162f0530.camel@sipsolutions.net>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 17:26:01 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 17:25:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] moving variable declarations up
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



On Wed, 17 Jun 2020, Johannes Berg wrote:

> On Wed, 2020-06-17 at 23:19 +0200, Johannes Berg wrote:
> > On Wed, 2020-06-17 at 23:15 +0200, Julia Lawall wrote:
> > > > +T x;
> > >
> > > Change the + to ++
>
> Heh, something funny happened
>
> + u16 *foo;
> + u16[2] bar;
>
> ... some code ...
>
> -u16 *foo;
> -u16 *bar[2];
>
>
> What happened to the array index?
>
> I guess ... at some level I even understand it, that's a property of the
> type, and I was moving the type around. But I really didn't expect that
> :)

What version of Coccinelle do you have?

There has been a lot of work on types recently that may have affected
this.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
