Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2861F3787
	for <lists+cocci@lfdr.de>; Tue,  9 Jun 2020 12:02:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 059A1fv1008069;
	Tue, 9 Jun 2020 12:01:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DB7F53F9A;
	Tue,  9 Jun 2020 12:01:40 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DB6F23F9A
 for <cocci@systeme.lip6.fr>; Tue,  9 Jun 2020 12:01:38 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 059A1Zwo021273
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 9 Jun 2020 12:01:35 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,491,1583190000"; d="scan'208";a="351033513"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 12:00:48 +0200
Date: Tue, 9 Jun 2020 12:00:47 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2006091200350.2516@hadrien>
References: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 09 Jun 2020 12:01:41 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 09 Jun 2020 12:01:35 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 0/4] parsing_c: parser: Add end_attributes_opt
	rule
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



On Mon, 8 Jun 2020, Jaskaran Singh wrote:

> Patches for improving the C parsing of attributes[1] introduced a lot
> redundant code in the C parser. This patch series resolves this by adding
> a rule for optional end attributes and merging the redundant code
> together.

All are applied, thanks.

julia

>
> [1]
> [PATCH v2 00/25] cocci: Improve C parsing of attributes
> https://lore.kernel.org/cocci/20200528122428.4212-1-jaskaransingh7654321@gmail.com/
>
> Jaskaran Singh (4):
>       parsing_c: parser: Add end_attributes_opt rule
>       parsing_c: parser: Use end_attributes_opt in decl2
>       parsing_c: parser: Use end_attributes_opt in field_declaration
>       parsing_c: parser: Use end_attributes_opt in cpp_other
>
>  parser_c.mly |   96 +++++------------------------------------------------------
>  1 file changed, 9 insertions(+), 87 deletions(-)
>
>
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
