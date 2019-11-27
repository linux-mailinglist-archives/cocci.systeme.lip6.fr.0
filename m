Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF110B87F
	for <lists+cocci@lfdr.de>; Wed, 27 Nov 2019 21:44:13 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xARKhuYg009708;
	Wed, 27 Nov 2019 21:43:56 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5367277DF;
	Wed, 27 Nov 2019 21:43:56 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DAABA77D2
 for <cocci@systeme.lip6.fr>; Wed, 27 Nov 2019 21:43:53 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xARKhqbS004312
 for <cocci@systeme.lip6.fr>; Wed, 27 Nov 2019 21:43:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,250,1571695200"; d="scan'208";a="328269542"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 21:43:52 +0100
Date: Wed, 27 Nov 2019 21:43:52 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20191127173815.24988-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.1911272143410.2559@hadrien>
References: <20191127173815.24988-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Nov 2019 21:43:56 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 27 Nov 2019 21:43:52 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr,
        skhan@linuxfoundation.org
Subject: Re: [Cocci] [PATCH 0/2] cocci: Fix continue statement of death and
 similar cases
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


On Wed, 27 Nov 2019, Jaskaran Singh wrote:

> The following patch series is for fixing the "continue statement of
> death" report here:
>
> https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06199.html
>
> Changes include removing circular references that cause the crash
> and adding a corresponding test case.

Applied, thanks.

julia

>
>  engine/transformation_c.ml         |    2 +-
>  tests/stmt_removed_and_added.c     |    8 ++++++++
>  tests/stmt_removed_and_added.cocci |    7 +++++++
>  tests/stmt_removed_and_added.res   |    8 ++++++++
>  4 files changed, 24 insertions(+), 1 deletion(-)
>
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
