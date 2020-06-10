Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26F1F57FE
	for <lists+cocci@lfdr.de>; Wed, 10 Jun 2020 17:41:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05AFerft022631;
	Wed, 10 Jun 2020 17:40:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A177D7827;
	Wed, 10 Jun 2020 17:40:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CC3593BAB
 for <cocci@systeme.lip6.fr>; Wed, 10 Jun 2020 17:40:51 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05AFeosE020177
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 10 Jun 2020 17:40:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,496,1583190000"; d="scan'208";a="454031950"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 17:40:16 +0200
Date: Wed, 10 Jun 2020 17:40:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7cfacf39-224e-693e-1b7e-06914f8d0e26@web.de>
Message-ID: <alpine.DEB.2.21.2006101739460.2235@hadrien>
References: <88d56de0-0a22-3371-ebd9-0ccbbc81f76e@web.de>
 <alpine.DEB.2.21.2006091952570.2516@hadrien>
 <5156fabe-d9c0-def9-cd8c-d85b8b5c704f@web.de>
 <alpine.DEB.2.21.2006101653030.2235@hadrien>
 <4befcdd7-5c9c-ebfe-7c2b-f493c8c2cbc8@web.de>
 <alpine.DEB.2.21.2006101708580.2235@hadrien>
 <7cfacf39-224e-693e-1b7e-06914f8d0e26@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 10 Jun 2020 17:40:55 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 10 Jun 2020 17:40:50 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking software behaviour according to selected SmPL
 code variants
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



On Wed, 10 Jun 2020, Markus Elfring wrote:

> >> I hoped that my specification of a SmPL code exclusion should prevent
> >> the presentation of assignments (independent from statements and/or expressions).
> >
> > (
> > e = e1
> > |
> > *e
> > )
>
> @display@
> expression e;
> @@
> *brelse(e);
>  <+... when != e = ...
> (e = ...
> |
> *e
> )...+>
>
>
> I would find it nicer if I do not need to repeat a code exclusion specification
> as the first element of a SmPL disjunction for this special use case.

You don't.  The when you have is useless.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
