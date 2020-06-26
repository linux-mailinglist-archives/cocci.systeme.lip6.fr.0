Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0E20B883
	for <lists+cocci@lfdr.de>; Fri, 26 Jun 2020 20:43:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05QIgnJM014079;
	Fri, 26 Jun 2020 20:42:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CF4A03D0F;
	Fri, 26 Jun 2020 20:42:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 33B513D0F
 for <cocci@systeme.lip6.fr>; Fri, 26 Jun 2020 20:42:47 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05QIgkdF026695
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 26 Jun 2020 20:42:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,284,1589234400"; d="scan'208";a="456949389"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 20:42:38 +0200
Date: Fri, 26 Jun 2020 20:42:38 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <bc30f73a-c346-2592-bd74-8ac73ad6907f@web.de>
Message-ID: <alpine.DEB.2.22.394.2006262042310.10382@hadrien>
References: <9725bf1f-06ea-63f3-2322-ffcce21cb218@web.de>
 <alpine.DEB.2.22.394.2006262019430.10382@hadrien>
 <c5ef6ff2-2ea5-ba9c-82be-305ecc9ab877@web.de>
 <alpine.DEB.2.22.394.2006262034080.10382@hadrien>
 <bc30f73a-c346-2592-bd74-8ac73ad6907f@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 26 Jun 2020 20:42:49 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 26 Jun 2020 20:42:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the parsing for a nested SmPL disjunction
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



On Fri, 26 Jun 2020, Markus Elfring wrote:

> >> I assumed that I may omit the semicolon in such a SmPL code.
> >> Can the specification of a SmPL nest construct ever be sufficient here?
> >
> > No.  <+... ...+> matches a subtree of an AST.  For a variable
> > initialization, there is no subtree of the AST that includes both the
> > right side of an = and the ;.
>
> Can the abstract syntax tree be adjusted accordingly?

No.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
