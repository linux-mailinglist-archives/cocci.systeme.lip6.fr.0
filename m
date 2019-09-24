Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBBABD400
	for <lists+cocci@lfdr.de>; Tue, 24 Sep 2019 23:04:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8OL3kLm017949;
	Tue, 24 Sep 2019 23:03:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8BDA777B4;
	Tue, 24 Sep 2019 23:03:46 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6D034779E
 for <cocci@systeme.lip6.fr>; Tue, 24 Sep 2019 23:03:44 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8OL3itQ016570
 for <cocci@systeme.lip6.fr>; Tue, 24 Sep 2019 23:03:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,545,1559512800"; d="scan'208";a="320517489"
Received: from ip-215.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.215])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 23:03:43 +0200
Date: Tue, 24 Sep 2019 23:03:43 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d77d6c40-d148-540b-3071-dd2bce76c158@web.de>
Message-ID: <alpine.DEB.2.21.1909242303310.2589@hadrien>
References: <e07ce253-8a13-0f90-3ee0-79c1a0e78b38@web.de>
 <alpine.DEB.2.21.1909231058380.2283@hadrien>
 <e3e922ef-fab2-ee5c-57f1-0f36ccc682fd@web.de>
 <alpine.DEB.2.21.1909242219450.2589@hadrien>
 <3628f3d4-b9c2-d42a-b1a9-d5e7fe32f171@web.de>
 <alpine.DEB.2.21.1909242249540.2589@hadrien>
 <d77d6c40-d148-540b-3071-dd2bce76c158@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 24 Sep 2019 23:03:46 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 24 Sep 2019 23:03:44 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Reducing source code around return statements with SmPL?
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



On Tue, 24 Sep 2019, Markus Elfring wrote:

> >> I would expect that the selected identifier should refer to the same scope
> >> of the enclosing function implementation.
> >
> > It doesn't.  Identifier metavariables have no scope, and scope is only
> > taken into account within a rule, not beterrn rules.
>
> Will this information become relevant also for further improvements
> of the software documentation?
>
> Which object references can refer to items in an unique way?

Only positions are unique.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
