Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DDF134F47
	for <lists+cocci@lfdr.de>; Wed,  8 Jan 2020 23:06:00 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 008M5cvx021231;
	Wed, 8 Jan 2020 23:05:38 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6CF6377EA;
	Wed,  8 Jan 2020 23:05:38 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AB56D7718
 for <cocci@systeme.lip6.fr>; Wed,  8 Jan 2020 23:05:35 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 008M5ZjR002255
 for <cocci@systeme.lip6.fr>; Wed, 8 Jan 2020 23:05:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,411,1571695200"; d="scan'208";a="335207876"
Received: from abo-154-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.154])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 23:05:34 +0100
Date: Wed, 8 Jan 2020 23:05:34 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: David Young <dyoung@netbsd.org>
In-Reply-To: <20200103160304.GG17258@pobox.com>
Message-ID: <alpine.DEB.2.21.2001082304490.2735@hadrien>
References: <20200102220345.GF17258@pobox.com>
 <alpine.DEB.2.21.2001030727330.2980@hadrien>
 <20200103160304.GG17258@pobox.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jan 2020 23:05:40 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jan 2020 23:05:35 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] transforming arguments to statement macros?
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

On Fri, 3 Jan 2020, David Young wrote:

> On Fri, Jan 03, 2020 at 07:32:09AM +0100, Julia Lawall wrote:
> > I think that the problem is that there is no ; in the uses of your macro.
>
> I was afraid of that.
>
> > The proper way to write such a macro, independent of Coccinelle, is as a
> > while do(0) loop, so that the uses can end in a semicolon.  Then there is
> > no possibility of strange mistakes if someone actually does put a
> > semicolon.  Would that be feasible to do?
>
> I would prefer that the macros were written with the do-while pattern,
> but it's a legacy codebase that uses HGOTO_ERROR() no fewer than 12,000
> times, and most occurrences have no semicolon.  I will have to automate
> the conversion, and I guess that I cannot use spatch to do it. :-) I may
> be able to write a suitable vim macro.

You should now be able to update the arguments, despite the lack of a
semicolon.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
