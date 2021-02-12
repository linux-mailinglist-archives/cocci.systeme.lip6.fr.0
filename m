Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2F31A048
	for <lists+cocci@lfdr.de>; Fri, 12 Feb 2021 15:06:47 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11CE6IVX023965;
	Fri, 12 Feb 2021 15:06:18 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A81E577DD;
	Fri, 12 Feb 2021 15:06:18 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 13B483B26
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 15:06:17 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11CE6GVV011565
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 15:06:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,173,1610406000"; d="scan'208";a="492707617"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 15:06:16 +0100
Date: Fri, 12 Feb 2021 15:06:16 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Taylor Blau <me@ttaylorr.com>
In-Reply-To: <YCKi4Ca0RbcfZLRB@nand.local>
Message-ID: <alpine.DEB.2.22.394.2102121506050.9350@hadrien>
References: <YCKi4Ca0RbcfZLRB@nand.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 12 Feb 2021 15:06:18 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 12 Feb 2021 15:06:16 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Missing package for Ubuntu 20.04 LTS?
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



On Tue, 9 Feb 2021, Taylor Blau wrote:

> Hi,
>
> The Git project recently noticed that our static analysis builds were
> failing after upgrading to Ubuntu 20.04 due to being unable to find the
> coccinelle package in the focal suite.
>
>     https://lore.kernel.org/git/YCGrmsg8J7XT32TM@nand.local/
>
> Searching for coccinelle [1] turns up hits in the xenial, bionic, and
> groovy suites, but not the focal ones. This appears to have been
> discussed on this list a couple of times without any conclusion.
>
> Is there a planned release of coccinelle that will appear in the focal
> suite?

Can you use the PPA?

https://launchpad.net/~npalix/+archive/ubuntu/coccinelle

julia

>
> Thanks,
> Taylor
>
> [1]: https://packages.ubuntu.com/search?keywords=coccinelle
> [2]: http://archive.ubuntu.com/ubuntu/pool/universe/c/coccinelle/
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
